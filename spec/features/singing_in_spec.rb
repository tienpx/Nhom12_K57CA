require 'spec_helper'

feature "signing in." do
  scenario 'Signing in via form' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button "Sign in"    
  end
  scenario 'Signing in with incorrect username or password' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Name', with: user.name + "aa"
    fill_in 'Password', with: user.password
    click_button "Sign in"    
  end  
end