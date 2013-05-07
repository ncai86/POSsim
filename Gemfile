source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'faraday'
gem 'rails_config'

gem 'rabl', ">= 0.7.1"
gem 'httpclient'
gem 'faker', github: "roomorama/faker"



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'debugger', '>= 1.3.1'
  gem 'wkhtmltopdf-binary'
  gem 'quiet_assets'
end

group :test do
  gem 'rspec', '~> 2.13.0', require: 'rspec'
  gem 'rspec-rails', '~> 2.13.0'
  gem 'rspec-instafail'
  gem 'spork', '~> 0.9.0'
  gem 'factory_girl_rails', '~> 4.2.0'
  gem 'webmock'
  gem 'vcr', '2.2.5'
  gem 'capybara', '~> 2.0'
  gem 'database_cleaner', github: "bmabey/database_cleaner"
  gem 'rack-test', '0.6.1'
  gem 'capybara-webkit', '>= 0.12.0'
  gem 'capybara', '~> 2.0'
  gem 'selenium-webdriver', '>= 2.25.0'
end


gem 'jquery-rails'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
