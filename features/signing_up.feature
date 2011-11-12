Feature: Signing up
  In order to be attributed for my work
  As a user
  I want to be able to sign up

  Scenario: Signing up
    Given I am on the home page
    When I navigate to the sign-up page
    And I fill in valid user information
    Then I should see the sign-up verification message
