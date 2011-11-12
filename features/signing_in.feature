Feature: Signing in
  In order to use the site
  As a user
  I want to be able to sign in

  Scenario: Signing in via confirmation
    Given there is a user
    And "user@ticketee.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see the registration confirmation message
    And I should be signed in
