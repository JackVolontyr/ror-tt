require 'webdrivers'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w(headless window-size=1024,768) },
      loggingPrefs: { browser: 'ALL' }
  )

  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 desired_capabilities: capabilities
end

Capybara.default_max_wait_time = 5
Capybara.javascript_driver = :headless_chrome # :chrome simulates behavior in browser
Capybara.server_port = 31337 + ENV['TEST_ENV_NUMBER'].to_i
Capybara.configure do |config|
  config.always_include_port = true
end