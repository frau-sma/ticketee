Feature: Deleting tickets
  In order to get rid of no longer needed tickets
  As a user
  I want to be able to delete them

  Background:
    Given I am a confirmed user
    And a project exists
    And the project has a ticket
    And I am on the home page
    When I navigate to the project's page
    And I navigate to the first ticket's page

  Scenario: Deleting a ticket
    When I ask for the ticket to be deleted
    Then I should have to sign in
    When I navigate to the project's page
    And I navigate to the first ticket's page
    And I ask for the ticket to be deleted
    Then I should see the ticket deleted verification message
    And I should be on the relevant project page
