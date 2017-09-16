Feature: Viewer visits the target page, signs in for target page
  In order to read the page
  As a viewer
  I want to see the target page

Scenario: Find button on target page
  Given I am on the target page
  Then I should see "myTarget" in the selector "span.welcome-block__txt-strong"

Scenario: Open modal window Sign In
  When I click '//*[@id="portal-headline"]/div/div[3]/div/span/span/span[2]/span'
  Then I also should see 'Sign in' in the selector "div.auth-popup__title.auth-popup__title_top.js-item-on-tabtext"

Scenario: Fill out form
  When I fill in "name" with "John Doe"
  And I fill in "email" with "john@doe.com"
  And I click "Sign Up!"
  Then I should see "Hi there, John Doe. You&#39;ll new receive our email newsletter at john@doe.com"
