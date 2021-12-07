require 'pg'

begin

    # con = PG.connect :dbname => 'bookmark_manager', :user => 'Swa'
    
    rs = con.exec "SELECT * FROM bookmarks"

    list_bookmarks = rs.map do |row|
      puts [ row['url'] ]
    end

end