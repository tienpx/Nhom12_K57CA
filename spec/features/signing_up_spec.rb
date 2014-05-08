require 'spec_helper'

feature 'Signing up' do
  before do
    visit '/'
    click_link 'Sign up'
  end

  scenario 'Sign up title' do
    expect(page).to have_title(" | Sign up")
  end

  scenario 'Successful sign up' do
    fill_in "Username", with: "thuynt"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end

  scenario 'sign up with password comfirmation not match' do
    fill_in "Username", with: "thuynt"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "anything"
    click_button "Sign up"
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "email format is not invalid" do
    fill_in "Username", with: "thuynt"
    fill_in "Email", with: "user@example"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Email is invalid")
  end

  scenario "email address is already taken" do
    fill_in "Username", with: "Alice"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    click_link 'Sign out'
    click_link 'Sign up'
    fill_in "Username", with: "thuynt"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Email has already been taken")
  end
end
