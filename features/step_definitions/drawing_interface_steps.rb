When(/^I click button "(.*?)"$/) do |button|
  click_button button
end

Then(/^I should see "(.*?)" input field$/) do |name|
  page.should have_content name
end

When(/^I enter "(.*?)" to "(.*?)" input field$/) do |arg1, arg2|
  pass
end

Then(/^I should see "(.*?)" is "(.*?)"$/) do |arg1, arg2|
  page.shoule have_content arg1
end
