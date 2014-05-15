And(/^I press "([^\"]*)" button$/) do |arg|
  page.find("input[value='#{arg}'").click
end