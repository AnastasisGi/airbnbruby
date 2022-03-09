require 'capybara/rspec'
# require 'sinatra/activerecord/rake'
require_relative './support/database_helper.rb'
# require_relative '../app/controllers/app_controller.rb'
require './app/app'


Capybara.app = Airbnbruby