require_relative "../../crawler"
require 'capybara'
require 'capybara/cucumber'
require 'rspec'

World do
  Capybara.app = ad-company-starter

  include Capybara::DSL
  include RSpec::Matchers
end
