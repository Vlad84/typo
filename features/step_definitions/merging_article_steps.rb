Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create!(article)
  end
end

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    article = Article.find_by_title(comment[:title])
    article.comments.build(comment)
    article.save
  end
end

And /I merge "(.*)" and "(.*)"/ do |article_1, article_2|
  steps %Q{
    
    Given I am on the Edit page for #{article_1}
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should be on the home page
  }
end
