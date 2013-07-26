require 'spec_helper'

feature 'Search functionality' do
  scenario 'User can access homepage' do
    visit root_path
    expect(page).to have_title 'Search Twitter'
  end

  scenario 'User can search from homepage' do
    visit root_path
    fill_in 'Query', with: '#query'
    click_button 'Search'
    expect(page).to have_css 'h1', 'Searching for #query'
  end

  scenario 'User can search from results page' do
    visit '/searches/query'
    fill_in 'Query', with: '#new_query'
    click_button 'Search'
    expect(page).to have_css 'h1', 'Searching for #new_query'
  end

  scenario 'Navigating directly to results page will prepend #' do
    visit '/searches/query'
    expect(page).to have_css 'h1', 'Searching for #query'
  end

  scenario 'Searching for hashtag will redirect to seo-friendly url' do
    visit root_path
    fill_in 'Query', with: '#query'
    click_button 'Search'

    uri = URI.parse(current_url)
    expect(uri.path).to eq '/searches/query'
  end
end