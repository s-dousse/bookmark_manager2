require 'pg'
require 'singleton'

class Setup
  include Singleton
  def truncate
    p "cleanup up test database ... "
    con = PG.connect(dbname: 'bookmark_manager_test')
    con.exec('TRUNCATE bookmarks_test')
  end
end