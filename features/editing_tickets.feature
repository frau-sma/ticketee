Feature: Editing tickets
  In order to alter ticket information
  As a user
  I want to be able to edit tickets

  Background:
    Given a project exists
    And the project has a ticket
    And I am on the home page
    When I navigate to the project's page
    And I navigate to the first ticket's page
    And I ask to edit the ticket

  Scenario: Updating a ticket
    When I fill in valid new ticket information
    Then I should see the ticket updated verification message
    And I should be on the updated ticket's page

  Scenario: Updating a ticket with invalid information
    When I fill in invalid new ticket information
    Then I should be informed that the ticket has not been updated
