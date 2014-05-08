require 'spec_helper'

feature 'drawing page' do

  scenario 'should have tools box' do
    visit '/mindmap/index/'
    expect(page).to have_css("div#tools_box")
  end

  scenario 'should have status bar' do
    visit '/mindmap/index/'
    expect(page).to have_css("div#status_bar")
  end

  scenario 'should have draw area' do
    visit '/mindmap/index/'
    expect(page).to have_css("div#draw_area")
  end

  scenario 'should have library' do
    visit '/mindmap/index/'
    expect(page).to have_css("div#library")
  end

  scenario 'create menu_bar buttons' do
    visit '/mindmap/index/'
    expect(page).to have_css("div#menu_bar")
  end

end
