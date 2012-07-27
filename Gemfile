source 'https://rubygems.org'
gem 'rails', '3.2.2'

gem "mongoid", "~> 2.4"
gem "bson_ext", "~> 1.5"
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails', :git => "git://github.com/seyhunak/twitter-bootstrap-rails.git", :branch => "static"
end
gem 'jquery-rails'
gem "haml", ">= 3.1.4"
gem "haml-rails", ">= 0.3.4", :group => :development
gem 'delayed_job'
gem 'delayed_job_mongoid'
gem 'heroku'
gem 'kaminari'
gem 'devise'
gem 'feedzirra', :git => "https://github.com/SoftwareWithFriends/feedzirra.git" #use our fork for now due to dependency issue on active support in main repo

group :test, :development do
  gem "rspec-rails", "~> 2.6"
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'mongoid-rspec'
  gem 'vcr'
  gem 'webmock'
end
