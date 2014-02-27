Feature: As a user I should be able to log in

	Scenario: As a user, I want to be able to sign in to the Blocipedia.
		Given a "User" exists with attributes: "email": "test@email.com", "password": "password"
		When I go to the root page
		And I click 'Sign In'
		And I go to the new_user_session page
		And I fill in 'Email' with 'test@email.com'
		And I fill in 'Password' with 'password'
		And I click 'Sign in'
		Then a User should be logged in with: "email": "test@email.com"