Feature: Viewing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects

  Scenario: Listing all projects
    Given a project exists
    And I am on the home page
    When I navigate to the project's page
    Then I should be on the relevant project page
