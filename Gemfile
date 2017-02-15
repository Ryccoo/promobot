source 'https://rubygems.org'
ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'nokogiri'
gem 'nokogumbo'
gem 'dotenv-rails'
gem 'facebook-messenger'
gem 'rack-cors'
gem 'ransack'
gem 'puma', '~> 3.0'

group :development, :test do
  gem 'pry'
  gem 'byebug', platform: :mri
  gem 'database_cleaner'
  gem 'rspec'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'simplecov'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
