source 'http://rubygems.org'

gem 'rails', '3.0.5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gem for the DB adaptor
gem 'mysql2'
#Gem for the user authentication 
gem 'devise'
#Gem for the webserver
gem 'mongrel'
#Gem for the page slice
gem 'will_paginate','3.0pre'
#Gem for upload attachements 2011-05-02
#Usage rails generate paperclip photo<model> data<attachement_name>
#use has-attachment_file: <attachement_name>
gem 'paperclip'
#Gem for MIME type files 2011-05-02
gem 'mime-types', :require => 'mime/types'
#Gem for using the Prototype ujs instead of jquery-rails ujs
#Usage rails generate jquery-rails:install
gem 'jquery-rails'
#Gem for uuidtools 
#Usage UUIDTools::UUID.parse_raw()
gem 'uuidtools'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
   #Gem for the anotate for the DB table attributes
   gem 'annotate-models'
   #Gem for the factory to add test data
   gem 'faker'
end
