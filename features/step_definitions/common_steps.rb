Given(/^I( do not)? have a qualifying purchase$/) do |negate|
	negate ? sign_in("rewards.lowprob@emailreaction.org", "lowprob")
		   : sign_in("rewards.highprob@emailreaction.org", "highprob")
end

Given(/^I have a membership$/) do
	step "I am signed in"
	step "I claim Meerkat Movies"
	expect(page).to have_selector(:link_or_button, "Back to your rewards")
	click_link_or_button "Back to your rewards", :match => :first
end	

Given(/^I am( not)? signed in$/) do |negate|
	negate ? visit("/")
	       : sign_in("rewards.highprob@emailreaction.org", "highprob")
end

When(/^I access ([^"]*) page$/) do |pageName|
	jump_to(pageName)
end

When(/^I click to "([^"]*)"$/) do |buttonText|
	case buttonText
	when "Find out more"
		within(".claim-meerkat-movies") do
			expect(page).to have_selector(:link_or_button, buttonText)
			click_link_or_button buttonText, :match => :first
		end
	else
		expect(page).to have_selector(:link_or_button, buttonText)
		click_link_or_button buttonText, :match => :first
	end
end

When(/^I select the ([^"]*) product$/) do |product|
	click_button "Claim a reward", :match => :first
	case product
	when "car insurance"
		find("#product-selection-PC").click
	when "travel insurance"
		find("#product-selection-TR").click
	when "home insurance"
		find("#product-selection-HH").click
	when "pet insurance"
		find("#product-selection-PT").click
	when "energy"
		find("#product-selection-EN").click
	when "van insurance"
		click_button("Show more")
		find("#product-selection-LC").click
	when "bike insurance"
		click_button("Show more")
		find("#product-selection-BI").click
	when "credit card"
		click_button("Show more")
		find("#product-selection-CC").click
	when "loan"
		click_button("Show more")
		find("#product-selection-LN").click
	when "life insurance"
		click_button("Show more")
		find("#product-selection-LI").click
	when "landlord insurance"
		click_button("Show more")
		find("#product-selection-SM").click
	when "mobile phone"
		click_button("Show more")
		find("#product-selection-MB").click
	when "broadband"
		click_button("Show more")
		find("#product-selection-DI").click
	end
	case product
	when "travel insurance"
		expect(page).to have_text("If you have bought travel insurance through comparethemarket.com you can only claim MEERKAT MOVIES.")
		expect(page).to have_no_text("You may only claim one reward for each qualifying purchase.")
		expect(page).to have_no_text("If you claim a meerkat toy, you must claim within 60 days of the qualifying purchase start date.")
	when "mobile phone"
		expect(page).to have_text("If you have bought a mobile phone through comparethemarket.com you can only claim MEERKAT MOVIES.")
		expect(page).to have_no_text("You may only claim one reward for each qualifying purchase.")
		expect(page).to have_no_text("If you claim a meerkat toy, you must claim within 60 days of the qualifying purchase start date.")
	else
		expect(page).to have_text("You may only claim one reward for each qualifying purchase.")
		expect(page).to have_text("If you claim a meerkat toy, you must claim within 60 days of the qualifying purchase start date.")
	end
	click_button("Choose reward")
end

When(/^I select the ([^"]*) toy$/) do |toyName|
	step "I select the car insurance product"
	case toyName
	when "AleksandrBatmanToy", "SergeiSupermanToy"
		find("#productLabel-#{toyName}").click
	else
		find("h4", :text => toyName).click
	end
	click_button("Confirm details")
end

When(/^I( try to)? claim (Meerkat Movies|a toy)$/) do |trying, type|
	step "I select the car insurance product"
	if not trying then
		case type
		when "Meerkat Movies"
			find("#choose-meerkat-movies").click
		when "a toy"
			find("#product-selection-SergeiToy").click
		end
		click_button("Confirm details")
		fill_details("Mr","Bob","Marley","rewards.highprob@emailreaction.org","AA")
		click_button("Claim your reward")
	end
end

Then(/^I am able to claim the ([^"]*) toy/) do |toyName|
	toyPrettyName = case toyName
					when "AleksandrBatmanToy"
						"Aleksandr as BatmanTM"
					when "SergeiSupermanToy"
						"Sergei as SupermanTM"
					else
						toyName
					end
	expect(page).to have_text(toyPrettyName)
	fill_details("Mr","Bob","Marley","rewards.highprob@emailreaction.org","AA")
	click_button("Claim your reward")
	expect(page).to have_text(toyPrettyName)
end

Then(/^I can(not)? claim (Meerkat Movies|a toy|martha reward)$/) do |negate, type|
	case type
	when "Meerkat Movies"
		negate ? (expect(page).to have_no_css("#choose-meerkat-movies"))
		       : (expect(page).to have_css("#choose-meerkat-movies"))
	when "a toy"
		negate ? (expect(page).to have_no_css(".toy-selection"))
			   : (expect(page).to have_css(".toy-selection"))
	when "martha reward"
		negate ? (expect(page).to have_no_css(".bundle-banner"))
			   : (expect(page).to have_css(".bundle-banner"))
	end
end

Then(/^I am( not)? approved for (Meerkat Movies|a toy)$/) do |negate, type|
  	case type
  	when "Meerkat Movies"
  		negate ? check_page("Validation")
  		       : check_page("Movies Congratulations")
  	when "a toy"
  		negate ? check_page("Validation")
  			   : check_page("Toy Congratulations")
  	end
end

Then(/^The claim status is "([^"]*)"$/) do |claimStatus|
	expect(page).to have_text(claimStatus)
end

Then(/^([^"]*) page is displayed$/) do |pageName|
	check_page(pageName)
end

Then(/^"([^"]*)" is opened$/) do |expected|
	within_window(windows.last) do
		expect(page).to have_text(expected)
	end
	windows.last.close()
end

def sign_in(email, password)
	visit("/")
	if page.has_text?("Sign in to your account") then
		fill_in "emailAddress", with: email
		fill_in "password", with: password
		click_link_or_button("Sign in")
	end
	expect(page).to have_no_text("Sign in to your account")
end

def fill_details(title, firstname, lastname, email, brand)
	if not find("#title")["disabled"] then
		select title, from: "title", :match => :first
	end
	if page.has_no_field?("#firstname[readonly='readonly']") then
		fill_in "firstname", with: firstname
	end
	if page.has_no_field?("#surname[readonly='readonly']") then
		fill_in "surname", with: lastname
	end
	if page.has_no_field?("#email[readonly='readonly']") then
		fill_in "email", with: email
	end
	# if page.has_text?("House number or name") then
	# 	fill_in "houseNumber", with: "2"
	# 	fill_in "postcode", with: "WR141AZ"
	# 	click_button("Find")
	# end
	# if page.has_text?("Address line 1") then
	# 	fill_in "manualAddressLine1", with: "2"
	# 	fill_in "manualAddressTownCity", with: "Malvern"
	# 	fill_in "manualAddressPostCode", with: "WR14 1AZ"
	# end
	select brand, from: "brand", :match => :first
	find("#termsLabel").click
	find("#boughtProductLabel").click
end

def jump_to(pageName)
	case pageName
	when "Home"
		visit("/")
	when "Product"
		visit("/claim")
	when "Reward"
		visit("/claim/car-insurance")
	when "Toys Details"
		visit("/claim/car-insurance/bogdan")
	when "Movies Details"
		visit("/claim/car-insurance/meerkat-movies")
	when "Congratulations", "Validation"
		visit("/claim/congratulations")
	when "History"
		visit("/claim/claims-history")
	when "Invalid Reward" 
		visit("/claim/travel-insurance/oleg")
	when "Invalid Product"
		visit("/claim/fruit-insurance")
	end
end

def check_page(pageName,membership=false)
	case pageName
	when "Home"
		if membership then
			expect(page).to have_text("")
		else
			expect(page).to have_text("We like to reward our customers for purchasing through us. You can choose a reward each time you buy a qualifying product through comparethemarket.com.")
		end
	when "Product"
		expect(page).to have_text("Claiming a reward is easy. First of all please tell us what qualifying product you bought through comparethemarket.com.")
	when "Reward"
		if membership then
			expect(page).to have_text("Build up your meerkat toy collection and choose one of our thrillsy, claw-stitched cuddly toys.")
		else
			expect(page).to have_text("Tricky decision? Remember you can claim a new reward every time you buy a qualifying product.")
		end
	when "Toys Details", "Movies Details", "Details"
		expect(page).to have_text("Please check your details below to make sure the information is correct.")
	when "Movies Congratulations"
		expect(page).to have_text("CONGRATULATIONS")
	when "Toy Congratulations"
		expect(page).to have_text("THANK YOU")
	when "Validation"
		expect(page).to have_text("SERGEI IS CHECKING YOUR INFORMATION")
	when "History"
		expect(page).to have_text("Your reward history")
	when "Invalid Reward"
		expect(page).to have_text("This reward is no longer available, please choose another.")
	when "Invalid Product"
		expect(page).to have_text("Product codes not found")
	when "Sign In"
		expect(page).to have_text("Sign in to your account")
	end
end