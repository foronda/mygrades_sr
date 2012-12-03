Feature: Add Category
   In order to add category weights
   As an instructor
   I want to add category weights for a class

Scenario: add category
   Given I am on the categories page
   And I follow "New Category"
   And I fill in "Name" with "Homework"
   And I fill in "Weight" with "0.3"
   When I press "Create"
   Then I should see "Category was successfully created"
   