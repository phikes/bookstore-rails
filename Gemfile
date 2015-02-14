source 'https://rubygems.org'

ruby '2.1.4'

gem 'rails', github: 'rails/rails'  # This is a beta rails version!
gem 'rails-api'
gem 'rack-cors', :require => 'rack/cors'

gem 'sqlite3'
gem 'unicorn-rails'

gem 'isbn_validation'

group :development do
  gem 'pry-rails'
  gem 'pry-byebug'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'guard-rspec'
end
