source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

gem 'pg', group: :production

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

gem 'bootstrap-sass'
gem 'bootstrap-form'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

#Use Rubocop for static code analysis
gem 'rubocop', :git => 'git://github.com/bbatsov/rubocop.git'

# Use debugger
# gem 'debugger', group: [:development, :test]
group :test, :development do
  gem 'rspec-rails', '~> 2.14'
  gem "teaspoon"
  gem "phantomjs" , ">= 1.8.1.1"
end

group :test do
   gem 'capybara', '2.1.0'
   gem 'simplecov', '~> 0.7.1', :require => false
   gem 'cucumber-rails', :require => false
   gem 'database_cleaner'
   gem 'factory_girl_rails', '~> 4.2.1'
   gem 'selenium-webdriver'
end

gem 'rails_12factor', group: :production

