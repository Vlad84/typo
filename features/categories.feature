Feature: Create or edit categories
  As an admin
  In order to combine articles together 
  I want to create new categories and edit existing ones 

Background: articles and comments have been added to database
  Given the blog is set up
  And I am logged into the admin panel
  
  Given the following articles exist:
  | title                   | author | body         | user_id   |
  | Hello                   | Me     | Hallo mein   | 1         |
  | There                   | You    | schatz       | 2         |


Scenario: I should be able to access categories from admin panel
  Then I should see "Categories"
  When I follow "Categories"
  Then I should see "Permalink"
  And  I should see "Your category slug" 

Scenario: I should be able to create new categories
  Given I am on the Categories page
   Then I fill in "category_name" with "Cat1" 
   And  I fill in "category_description" with "Cat1" 
   Then I press "Save"
   And  I should see "Category was successfully saved"  

Scenario: I should be able to edit existing categories
  Given I am on the Categories page
   Then I fill in "category_name" with "Cat1" 
   And  I fill in "category_description" with "Cat1" 
   Then I press "Save"
   And  I should see "Category was successfully saved"
   Then I follow "Edit"  
   And  I fill in "category_description" with "111"
   When I press "Save"
   Then I should see "111"
   And  I should see "Category was successfully saved" 