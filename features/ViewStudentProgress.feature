Feature: View Studen Progress
   In order to view student progress
   As a student
   I want to see my class grade

Scenario: add category
   Given I am on the home page
   And I follow "Students"
   When I follow "New Student"
   Then I should see "New student"
