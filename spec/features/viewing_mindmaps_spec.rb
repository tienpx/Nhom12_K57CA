require 'spec_helper'

feature "Viewing mindmaps" do
 scenario "Viewing mindmaps for a given user" do
  user = FactoryGirl.create(:user, name: "sample_user")
  FactoryGirl.create(:mindmap, user: user,
       title: "sample_mindmap1")
  FactoryGirl.create(:mindmap, user: user,
       title: "sample_mindmap2")

  visit '/'
  click_link "Sign in"
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign in'
  
  click_link "sample_user"

  expect(page).to have_content("sample_mindmap1")
  expect(page).to have_content("sample_mindmap1")
 end
end
