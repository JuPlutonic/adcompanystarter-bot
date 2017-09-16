Given /^I am on the Target Sandbox Page$/ do
  visit "http://target-sandbox.my.com"
end

Then /^I should see "([^myTarget]*)"$/ do |text|
  page.should have_content text
end
