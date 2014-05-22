require 'spec_helper'

feature "Signing in" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit '/'
    click_link 'Sign in'
  end

  scenario 'title' do
    expect(page).to have_title(' | Sign in')
  end

  scenario 'with invalid information' do
    click_button "Sign in"

    expect(page).to have_selector('div.alert.alert-error')
  end

  scenario 'with valid information' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content(user.name)
    expect(page).to have_link('New')
    expect(page).to have_link('Profile')
    expect(page).to have_link('Settings')
    expect(page).to have_link('Sign out')
  end
end
