require 'capybara/rspec'
require_relative '../../app'
Capybara.app = BookmarkManager

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      Bookmark.create(url: "http://www.makersacademy.com", title: 'Markers')
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')
      Bookmark.create(url: "http://www.google.com", title: 'Google')

    visit('/bookmarks')

    expect(page).to have_content("Markers - http://www.makersacademy.com").once
    expect(page).to have_content("Destroy All Software - http://www.destroyallsoftware.com").once
    expect(page).to have_content("Google - http://www.google.com").once

  end
end