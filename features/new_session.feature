Feature: Session
  
    Scenario: I can create new session on site
      Given I visit on sign in page
      When I fill email and password and submit form
      Then I should redirect to projects path and see a new session welcome message
