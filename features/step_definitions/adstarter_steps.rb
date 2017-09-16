require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'capybara/dsl'
require 'rspec/expectations'
include RSpec::Matchers

Given /^I am on the Target Sandbox Page$/ do
  visit "http://target-sandbox.my.com"
end

Then /^I should see "([^myTarget]*)"$/ do |text|
  page.have_content? text
end

Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
  page.should have_selector selector, content: text
end

Then /^I should see "([^"]*)" in a link$/ do |text|
  page.should have_link text
end
