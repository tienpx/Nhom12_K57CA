When(/^I should see only on root node in the drawing area$/) do
  page.find('#draw_canvas').all.count.should == 1
end
