Feature: Create merge article for non admin
  As an author
  In order to condense repetitive info on the site
  I want to merge articles

Background: articles and comments have been added to database
  Given the blog is set up
  And I am logged into the author panel

  Given the following articles exist:
  | title                   | author | body         | user_id   |
  | Hello                   | author | Hallo mein   | 2         |

Scenario: Author should not be able to merge articles  
  When I follow "New Article"
  Then I should not see "Merge Articles"

Scenario: Author should not be able to merge articles  
    Given I am on the Edit page for Hello
    Then I should not see "Merge Articles"

 
