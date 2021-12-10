require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do

      connection = PG.connect(dbname: 'bookmark_manager_test')
      # Add the test data
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Markers');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy All Software');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("Markers - http://www.makersacademy.com")
      expect(bookmarks).to include("Destroy All Software - http://www.destroyallsoftware.com")
      expect(bookmarks).to include("Google - http://www.google.com")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.example.org', title: 'Test Bookmark').first

      expect(bookmarks.first.url).to eq 'http://www.example.org'
      expect(bookmarks.first.title).to eq 'Test Bookmark'
    end
  end
end