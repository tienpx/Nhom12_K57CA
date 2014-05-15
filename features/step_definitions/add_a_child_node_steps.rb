When(/^I click on the root node$/) do
  page.find('#draw_canvas > g').click
end

Then(/^I should see a new node added$/) do
  expect(page).to have_selector('#draw_canvas > g')
end

And(/^I click mouse on the mindmap at location\((\d+),(\d+)\)$/) do |x, y|
  page.execute_script("
    var event = new jQuery.Event('click');
    event.clientX = #{x};
    event.clientY = #{y};
    $('#draw_canvas').trigger(event);
  ")
end