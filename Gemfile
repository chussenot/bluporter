source 'https://rubygems.org'

ruby '2.1.1'

def linux?;     !! (RUBY_PLATFORM =~ /linux/) ;     end
def darwin?;    !! (RUBY_PLATFORM =~ /darwin/) ;    end
def darwin12?;  !! (RUBY_PLATFORM =~ /darwin12|darwin13/) ;  end
def windows?;   !! (RUBY_PLATFORM =~ /mswin|msys|mingw|cygwin|bccwin|wince|emc/);      end
def require_if(&block)
  block.call ? {} : {:require => false}
end

gem 'rails',                      '4.0.2'
gem 'sass-rails',                 '~> 4.0.3'
gem 'compass-rails'
gem 'uglifier',                   '>= 1.3.0'
gem 'coffee-rails',               '~> 4.0.0'
gem 'haml-rails'

gem 'gaston',                     '~> 0.5'
gem 'mongoid',                    github: 'mongoid/mongoid'
gem 'geocoder'
gem 'mongoid_search'
gem 'kaminari'
gem 'grape'
gem 'puma'
gem 'rails_12factor'
gem 'ffaker'

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'quiet_assets'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'foreman'
  gem 'heroku'
end

group :development, :test do
  gem 'fabrication'
  gem 'rspec-rails'
  gem 'pry-rails'
end

group :test do
  gem 'nokogiri'
  gem 'database_cleaner'
  gem 'faker'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'mongoid-rspec'
end

