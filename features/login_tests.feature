@focus
Feature: Login Tests
	In order to test devise
	As an user
	I want to test sign in and sign out of blog

	Background:
		Given I am on sign up screen
		When I fill in "Email" with "RobertoCarlos@email.com"
		And I fill in "Password" with "12345678"
		And I fill in "Password confirmation" with "12345678"
		When I press "Sign up"
		And I follow "Logout"

	Scenario: Sign in BlogNFL
		Given I am on login screen
		When I fill in "Email" with "Astrogilda@email.com"
		And I fill in "Password" with "shafuldifornio"
		When I press "Sign in"
		Then I should see "Invalid email or password."

	Scenario: Sign in BlogNFL
		Given I am on login screen
		When I fill in "Email" with "RobertoCarlos@email.com"
		And I fill in "Password" with "12345678"
		When I press "Sign in"
		Then I should not see "Invalid email or password."