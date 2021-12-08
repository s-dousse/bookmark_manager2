require 'pg'
require 'singleton'

class Setup
  include Singleton
  def truncate
    p 'Cleaning up test database...'
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec('TRUNCATE bookmarks')
  end
end