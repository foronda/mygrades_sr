source 'https://rubygems.org'

gem 'rails', '3.2.9'
gem "googlecharts", :require => "gchart"

# TabsOnRails Gem Dependency
gem 'tabs_on_rails'

# Simple Navigation Plugin
gem 'simple-navigation'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'guard-rspec'
  #gem 'wdm'
  gem 'cucumber'
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'launchy'
  gem "rspec-rails"
  gem "mocha", :require => false
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
	gem 'bootstrap-sass', '~> 2.1.1.0'
  gem 'uglifier', '>= 1.2.3'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'rb-fchange', '0.0.5', :require => false
  gem 'rb-notifu', '0.0.4', :require => false
  #gem 'win32console', '1.3.0'
  gem 'cucumber-rails'
  #gem 'rb-fchange', '0.0.5'
  #gem 'rb-notifu', '0.0.4'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
