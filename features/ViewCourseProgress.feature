Feature: View Course Progress
   In order to view course progress
   As a student of Tep's class
   I want to view my current progress and standing.

Scenario: View Course Progress
   Given that I am on the MyGrades home page
   And I am logged in as a student
   When I follow "View Progress" Column
   When I press "View Progress" Navigation Tab
   Then the View Progress Panel should be shown
   