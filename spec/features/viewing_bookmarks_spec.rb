require 'capybara/rspec'
require_relative '../../app'
Capybara.app = BookmarkManager

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      Bookmark.create(url: "http://www.makersacademy.com")
      Bookmark.create(url: "http://www.destroyallsoftware.com")
      Bookmark.create(url: "http://www.google.com")

    visit('/bookmarks')

    expect(page).to have_content("http://www.makersacademy.com").once
    expect(page).to have_content("http://www.destroyallsoftware.com").once
    expect(page).to have_content("http://www.google.com").once

  end
end