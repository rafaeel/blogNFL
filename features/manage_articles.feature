Feature: Manage Articles
	In order to make a blog
	As an author
	I want to create and manage articles

	Background:
		Given I am on sign up screen
		When I fill in "Email" with "RobertoCarlos@email.com"
		And I fill in "Password" with "12345678"
		And I fill in "Password confirmation" with "12345678"
		When I press "Sign up"

	Scenario: Articles List
		Given I have article titled "Cincinnati Bengals, Denver Broncos"
		When I go to the list of articles
		Then I should see "Cincinnati Bengals"
		And I should see "Denver Broncos"

	Scenario: Create an Article
		Given I have no articles
		And I am on the list of articles
		When I follow "New Article"
		And I fill in "Title" with "San Antonio 49ers"
		And I fill in "Post" with "The biggest!"
		And I press "Create Article"
		Then I should see "Article was successfully created."
		And I should see "San Antonio 49ers"
		And I should see "The biggest!"
		And I should have 1 article

	Scenario: Edit an Article
		Given I have article titled "New England Patriots, Cincinnati Bengals, Denver Broncos"
		Given I am on the list of articles
		And I follow the view link for "edit_2"
		Then I should see "Editing article"
		When I fill in "Post" with "The Cincinnati Bengals are a professional American football franchise based in Cincinnati, Ohio."
		And I press "Update Article"
		Then I should see "Article was successfully updated."

	Scenario: Show an article 
		Given I have article titled "New England Patriots, Cincinnati Bengals, Denver Broncos"
		Given I am on the list of articles 
		And I follow the view link for "show_3"
		Then I should see "Title: Denver Broncos"

	# Need DRIVER=selenium parameter on 'cucumber features'
	Scenario: Delete an article
		Given I have article titled "New England Patriots, Cincinnati Bengals, Denver Broncos"
		Given I am on the list of articles 
		And I follow the view link for "delete_1"
		Then I should confirm a javascript dialog
		Then I should see "Article was successfully destroyed."
