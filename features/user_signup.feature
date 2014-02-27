Feature: As a user I should be able to sign up

	Scenario: As a user, I should be able to sign up by providing a user name, password and email address.
		Given I do not have an account
		When I go to the new_user_registration page
		# And I fill in 'User Name' with 'testusername'
		And I fill in 'Email' with 'test@email.com'
		#And I fill in 'Name' with 'testname'
		And I fill in 'Password' with 'password'
		And I fill in 'Password confirmation' with 'password'
		And I click 'Sign up'
		Then a User should exist with: "email": "test@email.com"