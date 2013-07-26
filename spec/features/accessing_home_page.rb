require 'spec_helper'

feature 'Home Page Functionality' do
  scenario 'User can search Twitter' do
    visit root_path
    expect(page).to have_title 'Search Twitter'
  end

  scenario 'User can search from homepage' do
    visit root_path
    fill_in 'Query', with: '#query'
    click_button 'Search'
    expect(page).to have_css 'h1', 'Searching for #query'
  end
end