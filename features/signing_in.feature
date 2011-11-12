Feature: Signing in
  In order to use the site
  As a user
  I want to be able to sign in

  Scenario: Signing in via confirmation
    Given I am an unconfirmed user
    And "user@ticketee.org" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see the registration confirmation message
    And I should be signed in

  Scenario: Signing in via form
    Given I am a confirmed user
    And I am on the home page
    When I navigate to the sign-in page
    And I fill in my user details
    Then I should be signed in
