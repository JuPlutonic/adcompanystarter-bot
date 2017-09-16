require_relative "../../crawler"
require "Capybara"
require "Capybara/cucumber"
require "rspec"

World do
  Capybara.app = ad-company-starter

  include Capybara::DSL
  include RSpec::Matchers
end
