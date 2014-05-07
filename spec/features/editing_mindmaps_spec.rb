require 'spec_helper'


feature "Editing mindmaps" do
 let!(:user) { FactoryGirl.create(:user) }
 let!(:mindmap) { FactoryGirl.create(:mindmap, user: user) }
 
 before do
   visit '/'
   click_link "Sign in"
   fill_in 'Email', with: user.email
   fill_in 'Password', with: user.password
   click_button 'Sign in'
   click_link user.name
   click_link mindmap.title
   click_link "Edit Mindmap"
 end
 
 scenario "Updating a mindmap" do
   fill_in "Title", with: "Make it really shiny!"
   click_button "Update Mindmap"
   expect(page).to have_content "Mindmap has been updated."
   within("#mindmap h2") do
     expect(page).to have_content("Make it really shiny!")
   end
   expect(page).to_not have_content mindmap.title
 end
 
 scenario "Updating a ticket with invalid information" do
   fill_in "Title", with: ""
   click_button "Update Mindmap"
   expect(page).to have_content("Mindmap has not been updated.")
 end
end
