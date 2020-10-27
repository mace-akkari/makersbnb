ENV["RACK_ENV"] = "test"

require_relative "../lib/app.rb"

require "capybara"
require "capybara/rspec"
require "rspec"
require "capybara_helper"

Capybara.app = MakersBNB

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
