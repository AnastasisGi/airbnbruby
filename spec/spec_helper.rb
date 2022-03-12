require 'capybara/rspec'
# require 'sinatra/activerecord/rake'
require_relative './support/database_helper.rb'
# require_relative '../app/controllers/app_controller.rb'
require './app/app'

require 'factory_bot'
Capybara.app = Airbnbruby

RSpec.configure do |config|

 config.include FactoryBot::Syntax::Methods

 config.before(:suite) do
    FactoryBot.find_definitions
  end

end

