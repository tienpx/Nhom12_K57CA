require 'spec_helper'

feature 'image library' do

  before do
    visit '/mindmap/index'
  end

  scenario 'should have load image button' do
    expect(page.find('#lib_header')).to have_selector('input[name="commit"]')
  end

  scenario 'should have select category box' do
    expect(page.find('#lib_header')).to have_css('select#category')
  end

  scenario 'should have lib box' do
    expect(page.find('div#library')).to have_css('div#lib')
  end

  scenario 'can choose category from the select field' do
    select 'art', :from => 'category'
    click_button 'load images'
    expect(page.find('div#lib')).to have_css('ul#art')
  end
end