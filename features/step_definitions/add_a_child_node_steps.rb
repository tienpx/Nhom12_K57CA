When(/^I click on the root node$/) do
  find('#draw_canvas > .node:first-child').click()
end

Then(/^I should see a new node$/) do
  expect(page).to have_selector('#draw_canvas > .node', count: 2)
end

And(/^I should see a link between the root node and the newly created node$/) do
  pending
end