When(/^I go to the ([_a-z]+) page$/) do |page|
  visit self.send("#{page}_url")
end

When(/^I fill in '([a-zA-Z\s]+)' with '(.+)'$/) do |label, value|
  fill_in label, with: value
end

When(/^I click '([-_a-zA-Z\s]+)'$/) do |value|
  click_on value
end