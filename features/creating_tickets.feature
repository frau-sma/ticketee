Feature: Creating Tickets
  In order to create tickets for projects
  As a user
  I want to be able to select a project and create tickets

  Background:
    Given a project exists
    And I am a confirmed user
    And I am on the home page
    When I navigate to the project's page
    And I create a ticket
    Then I should have to sign in

  Scenario: Creating a ticket
    When I fill in valid ticket information
    Then I should see the ticket created verification message
    And I should be on the new ticket's page
    And the ticket should be attributed to me

  Scenario: Creating a ticket with invalid attributes
    When I fill in invalid ticket information
    Then I should be informed that the ticket has not been created
    And I should be told that the title is required
    And I should be told that the description is required
    
  Scenario: Description must be longer than 10 characters
    When I fill in information with a short description
    Then I should be informed that the ticket has not been created
    And I should be told that the description is too short
