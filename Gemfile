source 'https://rubygems.org'

gem 'rails', '4.1.1'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'unicorn'
gem 'devise'
gem 'haml-rails'
gem 'figaro'
gem 'simple_form'
gem 'twitter-bootstrap-rails'
gem 'httparty'

group :development do
  gem 'quiet_assets'
  gem 'spring'
  gem 'sqlite3'
  gem 'pry'
  gem 'pry-byebug'
  gem 'erb2haml' #rake haml:replace_erbs
  gem 'annotate' # adds reference schema comments to model
  gem 'better_errors' # makes the error page on browser much more efficient
  gem 'binding_of_caller' # adds a binding.pry ish session on errors in browser
end

group :production do
	gem 'pg'
	gem 'rails_12factor'
end
