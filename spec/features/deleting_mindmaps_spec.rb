require 'spec_helper'


feature 'Deleting minmaps' do
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
  end

  scenario "Deleting a mindmap" do
    click_link "Delete Mindmap"
    expect(page).to have_content("Mindmap has been deleted.")
    expect(page.current_url).to eq(user_url(user))
  end
end
