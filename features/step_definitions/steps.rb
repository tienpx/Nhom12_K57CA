Then(/^I should see a (\b.+\b) field$/) do |field|
  page.should have_content(field)
end

Then(/^I should see a (\b.+\b) button$/) do |button|
  page.should have_button(button)
end

Given(/^I have logged in$/) do
  true 
end

Given(/^I am on a public page$/) do
  true 
end

Then(/^I should see a mindmap$/) do
  pending 
end

Given(/^I haven't logged in$/) do
  true 
end

Given(/^I fill in the (\b.+\b) field with "(.+)"$/) do |field, content|
  true 
end

When(/^I press the (\b.+\b) button$/) do |button|
  click_button(button) 
end

Then(/^I should see "(.+)"$/) do |content|
  page.should have_content(content)
end
