require 'capybara/rspec'
require_relative '../../app'
Capybara.app = BookmarkManager

feature 'Adding bookmarks' do
  scenario 'A user can add bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks/new')
    fill_in('url', with: 'www.sarahdousse.com')
    click_button('Save')
    
    expect(page).to have_content('www.sarahdousse.com').once

  end
end