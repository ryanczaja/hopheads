Given(/^I do not have an account$/) do
  true
end

Given(/^a (\w+) is logged in with attributes: (.+)$/) do |model, attributes|
	attributes = attributize_string(attributes)

	step "I go to the new_user_session page"
	step "I fill in 'Email' with 'test@email.com'"
	step "I fill in 'Password' with 'password'"
	step "I click 'Sign in'"

	visit new_user_session_url
	current_url.should_not == new_user_session_url
end