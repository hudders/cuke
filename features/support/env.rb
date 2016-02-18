require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'selenium-webdriver'
# require 'capybara-webkit'
require 'capybara-screenshot/cucumber'

Capybara.default_wait_time = 5
Capybara.run_server = false
Capybara.app_host = ENV['TESTS_URL'] ||  'http://localhost:8080'

Capybara.register_driver :poltergeist do |app|
	Capybara::Poltergeist::Driver.new app, { js_errors: false }
end

case ENV['browser']
	when 'ff'
		Capybara.default_driver = :selenium
	else
		Capybara.default_driver = :poltergeist
	end

Capybara.save_and_open_page_path = "./screenshots"
Capybara::Screenshot.prune_strategy = :keep_last_run

# Allow Poltergeist debug by specifying debug=true on the command-line
# if ENV['debug'] == "true" then
# 	puts "Running in debug mode"
# 	options = { js_errors: false, timeout: Capybara.default_wait_time, phantomjs_logger: StringIO.new, logger: nil, phantomjs_options: ['--load-images=no', '--ignore-ssl-errors=yes', '--debug=true'] }
# else
# 	options = { js_errors: false }
# end

# Capybara.register_driver :poltergeist do |app|
# 	Capybara::Poltergeist::Driver.new app, options
# end

# Capybara.register_driver :selenium_chrome do |app|
# 	Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

# case ENV['browser']
# 	when 'chrome'
# 		Capybara.default_driver = :selenium_chrome
# 		browser_name = 'chrome'
# 	when 'firefox'
# 		Capybara.default_driver = :selenium
# 		browser_name = 'firefox'
# 	else
#         Capybara.default_driver = :poltergeist
#         browser_name = 'poltergeist'
# end

# puts "Running tests against webapp at #{Capybara.app_host}"
# puts "Running tests with #{browser_name}"