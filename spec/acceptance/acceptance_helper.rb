require 'rails_helper'
require 'support/acceptance_macros'
require 'support/database_cleaner'
require 'support/capybara_macros'

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  # Capybara.javascript_driver = :webkit

  # support/AcceptanceMacros
  config.include AcceptanceMacros, type: :feature

  # support/DatabaseCleaner
  config.include DatabaseCleaner

  # support/ControllerMacros
  config.extend ControllerMacros, type: :controller
end