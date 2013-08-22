Feature: Create merge article
  As an admin
  In order to condense repetitive info on the site
  I want to merge articles

Background: articles and comments have been added to database
  Given the blog is set up
  And I am logged into the admin panel
  
  Given the following articles exist:
  | title                   | author | body         | user_id   |
  | Hello                   | Me     | Hallo mein   | 1         |
  | There                   | You    | schatz       | 2         |

  Given the following comments exist:
  | body                    | author | title        |
  | This is great           | Ash    | Hello        |
  | This sucks              | Eve    | There        |




Scenario: Merged articles should contain the text of both previous articles
  Given I merge "Hello" and "There"
  Then I should see "Hello"
  When I follow "Hello"
  Then I should see "Hallo mein schatz"


Scenario: Merged articles should contain all comments
  Given I merge "Hello" and "There"
  Then I should see "Hello"
  When I follow "Hello"
  Then I should see "This is great"
  And I should see "Ash"
  And I should see "This sucks"
  And I should see "Eve"

Scenario: Merged articles should contain the title of one of the merged articles
  Given I merge "Hello" and "There"
  Then I should see "Hello"
  When I follow "Hello"
  Then I should see "Hello"

Scenario: Should not be able to see merge form when trying to create a new article
  When I follow "New Article"
  Then I should not see "Merge Articles"

  

