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

  scenario 'Searches will return 15 results' do
    visit root_path
    fill_in 'Query', with: '#hola'
    click_button 'Search'

    expect(page).to have_css 'ul', 'Results'
    expect(page).to have_css 'li'
  end

  scenario 'Searches will return results with my query value in them' do
    visit root_path
    fill_in 'Query', with: '#hola'
    click_button 'Search'

    within('.results') do
      expect(page.body).to match /#hola/i
    end
  end

  scenario 'Searches will return results with my query value in them' do
    Searches.searcher = FakeTwitter
    FakeTwitter.return_tweets_text = ['This is an awesome tweet!']
    visit root_path
    fill_in 'Query', with: '#hola'
    click_button 'Search'

    within('.results') do
      expect(page.body).to have_content 'This is an awesome tweet!'
    end
  end
end
