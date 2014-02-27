require 'json'
World(Devise::TestHelpers)

Then(/^a (\w+) should exist with: ("[a-z_]+": ".+")$/) do |model, attributes|
  attributes = attributize_string(attributes)
  model.constantize.where(attributes).first.should_not be_nil
end

Given(/^an? "(\w+)" exists with attributes: (.+)$/) do |model, attributes|
	attributes = attributize_string(attributes)
	FactoryGirl.create(model.downcase.to_sym, attributes)
end

Then(/^a (\w+) should be logged in with: ("[a-z_]+": ".+")$/) do |model, attributes|
  visit new_user_session_url
  current_url.should_not == new_user_session_url
end

Then(/^a (\w+) should have logged out$/) do |model|
  visit new_user_session_url
  current_url.should == new_user_session_url
end

def attributize_string(string)
	JSON.parse("{#{string}}")
end