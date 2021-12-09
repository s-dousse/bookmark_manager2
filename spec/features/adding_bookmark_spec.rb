require 'capybara/rspec'
require_relative '../../app'
Capybara.app = BookmarkManager

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://example.org')
    fill_in('title', with: 'Example')
    click_button('Submit')

    expect(page).to have_content('http://example.org').once
  end
end