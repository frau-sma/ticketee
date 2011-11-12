Feature: Deleting projects
  In order to remove no longer needed projects
  As a project manager
  I want to be able to delete them

  Scenario: Deleting a project
    Given I am an admin user
    And I am signed in
    And a project exists
    And I am on the home page
    When I navigate to the project's page
    And I ask that the project be deleted
    Then I should see the project deleted verification message
    And I should be on the home page
    And the project should not be there any more
