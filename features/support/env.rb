require_relative "../../crawler"
require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'capybara/dsl'
require 'rspec/expectations'
Capybara.javascript_driver = :chrome
Capybara.default_driver = :selenium_chrome
Capybara.configure do |config|
  config.app_host   = 'http://target-sandbox.my.com'
end
World(Capybara::DSL)
