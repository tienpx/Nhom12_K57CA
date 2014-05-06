When /^I should see only one root node in the drawing area$/ do
  expect(page).to have_selector('#draw_canvas > *', count: 1)
end