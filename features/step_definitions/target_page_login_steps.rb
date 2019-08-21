Given /^I am on the target page$/ do
  visit "https://target-sandbox.my.com"
end

Then /^I should see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
  page.have_selector?(selector, text: text)
end

When /^I click "([^"]*)"$/ do |element|
  find(:xpath, element).click
end

Then /^I also should see "([^"]*)" in the selector "([^"]*)"$/ do |text, selector|
  page.have_selector?(selector, text: text)
end

# Feature: Viewer visits the target page, signs in for target page
#   In order to read the page
#   As a viewer
#   I want to see the target page

# Scenario: visit_site_task Find button on target page
#   Given I am on the target page
#   Then I should see "myTarget" in the selector "span.welcome-block__txt-strong"

# Scenario: log_in_task Open modal window Sign In. Fill out form
#   When I click '//*[@id="portal-headline"]/div/div[3]/div/span/span/span[2]/span'
#   Then I also should see 'Sign in' in the selector "div.auth-popup__title.auth-popup__title_top.js-item-on-tabtext"

# Scenario: start_company_task
#   When I fill in "name" with "John Doe"
#   And I fill in "email" with "john@doe.com"
#   And I click "Sign Up"
#   Then I should see "Hi there, John Doe. You&#39;ll new receive our email newsletter at john@doe.com"

# Scenario: Click the button
#   When(/^I click the "(.*?)" button$/) do |arg1|
#     click_button(arg1)
#   end