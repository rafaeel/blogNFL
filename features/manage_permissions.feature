Feature: Manage Permissions
	In order to allow or not allow user to create an article
	As an user
	I want to create rules to my blog

	Background:
		Given the following user data
			| email | password | admin |
			| JosephClimber@email.com | secret12 | true |
			| MaoTseTung@email.com | secret23 | false |

	Scenario: Show the "You are admin" phrase to admin
		Given I am logged with "JosephClimber@email.com" with password "secret12"
		When I visit profile for "MaoTseTung@email.com"
		Then I should see "You are the admin" 

	Scenario: Hide the "You are admin" phrase to user or guest
		When I visit profile for "MaoTseTung@email.com"
		Then I should not see "You are the admin" 


	Scenario Outline:
		Given the following user data
			| email | password | admin |
			| Ronaldo@email.com | secret12 | true |
			| RobertoCarlos@email.com | secret23 | false |
		And I am logged with "<login>" with password "secret12"
		When I visit profile for "<profile>"
		Then I should <action>

		Examples:
			| login | profile | action |
			| Ronaldo@email.com | Josepho | see "You are the admin"  |
			| RobertoCarlos@email.com | Jason | not see "You are the admin"  |
			| Ronaldo@email.com | Rebeca | see "You are the admin"  |
			| RobertoCarlos@email.com | Giulia | not see "You are the admin"  |