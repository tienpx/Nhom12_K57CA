Then(/^I should see field named "([^\"]*)"$/) do |field|
  expect(page).to have_css("##{field}")
end