Feature: Viewer visits the Target Sandbox Page
  In order to read the page
  As a viewer
  I want to see the Target Sandbox Page

Scenario: View Target Sandbox Page
  Given I am on the Target Sandbox Page
  Then I should see "myTarget"

Scenario: Find button on Target Sandbox Page
  Given I am on the Target Sandbox Page
  Then I should see ".js-head-log-in" in the selector "span"

Scenario: Find the link to the form
  Given I am on the Target Sandbox Page
  Then I should see "Sign up for our newsletter." in a link
