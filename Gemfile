source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
	gem 'pg'
end

group :development do
	gem 'sqlite3'
end

gem 'jquery-rails'
gem 'faker'
gem 'devise'
gem 'cancan'
gem 'paperclip'
gem 'rmagick'
gem 'aws-sdk'
gem 'figaro'
gem 'omniauth-facebook'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.3.1.0'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test do
	gem 'cucumber-rails'
	gem 'capybara'
	gem 'rspec-rails'
	gem 'database_cleaner'
end

group :test, :develoment do
	gem 'factory_girl_rails'
	gem 'pry-debugger'
	gem "better_errors"
	gem "binding_of_caller"
	gem 'debugger', '~> 1.6.5'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

#To use debugger

