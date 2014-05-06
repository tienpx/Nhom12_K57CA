require 'spec_helper'

feature "Signing out" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
  scenario 'signing out successfully' do
  	click_link 'Account'
  	click_link 'Sign out'

  	expect(page).to have_link('Sign in')
  end
end