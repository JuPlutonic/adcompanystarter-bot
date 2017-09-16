require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'capybara/dsl'
require 'rspec/expectations'
include RSpec::Matchers

Given /^I am on the target page$/ do
  visit "https://target-sandbox.my.com"
end

Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
  page.should have_selector(selector, text: text)
end

When /^I click "([^"]*)"$/ do |element|
  find(:xpath, element).click
end

Then /^I also should see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
  page.should have_selector(selector, text: text)
end

