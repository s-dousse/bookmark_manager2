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
      Bookmark.create(url: 'http://www.example.org', title: 'Example')

      expect(Bookmark.all).to include 'Example - http://www.example.org'
    end
  end

  describe '.delete' do
    it 'deletes an existing bookmark' do
      Bookmark.create(url: 'http://www.example.org', title: 'Example2')
      Bookmark.delete(title: 'Example2')
      expect(Bookmark.all).not_to include 'Example2 - http://www.example.org'
    end
  end

  describe '.updates' do
    it 'updates an existing bookmark' do
      Bookmark.create(url: 'http://www.example.org', title: 'Example2')
      Bookmark.update(title: 'Example2', new_title: 'Example3', url: "www.example.com")
      expect(Bookmark.all).to include 'Example3 - www.example.com'
    end
  end


end