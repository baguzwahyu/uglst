source 'https://rubygems.org'

ruby '1.9.3', engine: 'jruby', engine_version: '1.7.12'

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'coffee-rails', '~> 4.0.0'
gem 'country_select'
gem 'devise'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pry-rails'
gem 'rails', '4.1.0'
gem 'sass-rails', '~> 4.0.3'
gem 'simple_form'
gem 'therubyrhino'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'capistrano-rails'
end

group :development, :test do
  gem 'activerecord-jdbcsqlite3-adapter'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'ffaker'
end

group :production do
  gem 'puma', require: false
  gem 'activerecord-jdbcpostgresql-adapter'
end

group :doc do
  gem 'sdoc', '~> 0.4.0'
end
