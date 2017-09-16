require_relative "../../crawler"
require 'capybara'
require 'capybara/cucumber'
require 'rspec'

World do
  include Capybara::DSL
  include RSpec::Matchers
end
