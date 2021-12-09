require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['title'].to_s + " - " + bookmark['url'].to_s }
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec_params(
      # The first argument is our SQL query template
      # The second argument is the 'params' referred to in exec_params
      # $1 refers to the first item in the params array
      # $2 refers to the second item in the params array
      "INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title]
    )
    # connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end
end