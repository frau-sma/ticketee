Feature: Editing Projects
  In order to update project information
  As a user
  I want to be able to do that through an interface

  Background:
    Given I am an admin user
    And I am signed in
    And a project exists
    And I am on the home page
    When I navigate to the project's page
    And I edit that project

  Scenario: Updating a project
    And I fill in new information
    Then I should see the project updated verification message
    And I should be on the edited project's page

  Scenario: Updating a project with invalid attributes
    And I fill in invalid information
    Then I should be informed that the project has not been updated
    And I should be told that the name is required
