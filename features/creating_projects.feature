Feature: Creating projects
  In order to have projects to assign tickets to
  As a user
  I want to create them easily

  Scenario: Creating a project
    Given I am on the home page
    When I navigate to the project creation page
    And I create a new project
    Then I should see the project created verification message
