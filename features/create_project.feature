Feature: Create Project
  
    Scenario: I can create a new project
      Given I am sign and visit create a project
      When I fill all field and submit create project path
      Then I should see a created project
