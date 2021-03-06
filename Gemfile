source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Version
ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# alert fixes
gem 'railties', '>= 5.2.3'
gem 'actionview', '>= 5.2.3'
gem 'nokogiri', '>= 1.10.2'
gem 'rack', '>= 2.0.7'
gem 'loofah', '>= 2.2.3'
gem 'rubyzip', '>= 1.2.2'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Comet Pub Sub
gem 'private_pub'
gem 'thin'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# User Login
gem 'devise'

# Heroku
gem 'rails_12factor'

# Heroku Sendgrid Mailer
gem 'sendgrid-ruby'

# Jquery
gem 'jquery-rails'

# Slim
gem 'slim'

# For file
gem 'carrierwave', '>= 2.0.0.rc', '< 3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Test env
  gem 'rspec-rails'
  gem 'factory_bot'
  gem 'rails-controller-testing'
  gem 'ffaker'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem "capybara-webkit"
end

group :development do
  gem 'letter_opener_web', '~> 1.0'

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # For Reading the Letter
  gem 'letter_opener'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'webdrivers', '~> 3.0'

  # Macros
  gem 'shoulda-matchers'

  # Cleaner
  gem 'database_cleaner'

  # Open page while testing
  gem 'launchy'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
