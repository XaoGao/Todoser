Feature: Project
  
    Scenario: I can should see the project title
      Given I am sign in for show project
      When I visit the project show page
      Then I should see project title
