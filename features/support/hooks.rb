Before("~@noclear") do |scenario|
	puts "sorting out database"
	`cd ../Rewards-Data-Bootstrapper && node app.js`
	puts "done"
end

Before do |scenario|
	visit("https://signin-shadow.sergeis-datacenter.co.uk/connect")
	Capybara.reset_sessions!
end