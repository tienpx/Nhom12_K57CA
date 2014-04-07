require 'spec_helper'

feature "User profile" do
	before do
        user = FactoryGirl.create(:user)

		visit '/'
		click_link 'Sign in'
        fill_in "Name", with: user.name
	    fill_in "Password", with: user.password
	    click_button "Sign in"
		click_link user.name
	
		expect(page.current_url).to eql(user_url(user))
	end

	scenario "Updating a user profile" do
		click_link "Edit profile"
		fill_in "Name", with: "abc beta"
		click_button "Update Profile"

		expect(page).to have_content("Your profile has been updated.")

	end

	scenario "Updating a user profile with invalid attributes is bad" do
		click_link "Edit profile"
		fill_in "Name", with: ""
		click_button "Update Profile"
		expect(page).to have_content("Your profile has not been updated.")
	end

end