require 'spec_helper'

feature "Creating Mindmaps" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit '/'
    click_link "Sign in"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link "New"
  end

  scenario "Creating a mindmap" do
    fill_in "Title", with: "bbb"
    click_button "Create Mindmap"
    
    expect(page).to have_content("Add a child node")
  end

  scenario "Creating a mindmap without valid attributes fails" do
    click_button "Create Mindmap"
    expect(page).to have_content("Title can't be blank")
  end
end  end
end