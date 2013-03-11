Feature: Write Articles
  As a blog administrator
  In order to combine similar thoughts together
  I want to be able to merge articles together

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And I have created an Article "article1" with body "Lorem Ipsum"
    And I have created an Article "article2" with body "The quick fox jumped over the lazy dog"
    And I have created a Comment on "article1" with content "Lorem 1"
    And I have created a Comment on "article1" with content "Lorem 2" 
    And I have created a Comment on "article2" with content "Font 1"
    And I have created a Comment on "article2" with content "Font 2" 


  Scenario: A non-admin cannot merge two articles
  
  Scenario: When articles are merged, the merged article should contain the text of both previous articles
  	And I go to the admin content page
    And I follow "article1"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "article1 article2"
    When I follow "article1 article2"
    Then I should see "Lorem Ipsum"
    And I should see "The quick fox jumped over the lazy dog"
    And I should see "Lorem 1"
    And I should see "Lorem 2"
    And I should see "Font 1"
    And I should see "Font 2"
