require 'spec_helper'

feature "User profile" do
	before do
    user = FactoryGirl.create(:user, name: "Alice")

		visit '/'
		click_link 'Sign in'
    fill_in "Email", with: user.email
	  fill_in "Password", with: user.password
	  click_button "Sign in"
	end

  scenario "title is user name" do
  	expect(page).to have_content("Alice")
  	expect(page).to have_title(" | Alice")
  end

	scenario "updating a user profile" do
		click_link "Edit"
		fill_in "Username", with: "abc beta"
		fill_in "Email", with: "b@gmail.com"
		fill_in "New password", with: "new"
		click_button "Save change"

		expect(page).to have_content("Your profile has been updated.")
	end

	scenario "Updating a user profile with invalid attributes is bad" do
		click_link "Edit"
		fill_in "Username", with: ""
		click_button "Save change"
		
		expect(page).to have_content("Your profile has not been updated.")
	end

end
