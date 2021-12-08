require 'capybara/rspec'
require_relative '../../app'
Capybara.app = BookmarkManager

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
    connection.exec("INSERT INTO bookmarks_test (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks_test (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks_test (url) VALUES('http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content("http://www.makersacademy.com/").once
    expect(page).to have_content("http://www.destroyallsoftware.com").once
    expect(page).to have_content("http://www.google.com/").once

  end
end