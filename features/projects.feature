Feature: Projects
  
    Scenario: I can should see projects
      Given I am sign in for projects
      When I visit the projects page
      Then I should see title for all projects
