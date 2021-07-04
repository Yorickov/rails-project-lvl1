# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

gem 'rake', '~> 13.0'

group :development do
  gem 'pry', '~> 0.13.1'
  gem 'rubocop', '~> 1.7'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
  gem 'solargraph'
end

group :test do
  gem 'rspec', '~> 3.0'
end
