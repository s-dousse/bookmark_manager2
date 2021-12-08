require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end

  post '/bookmarks' do
    # a) store 'url' as a variable
    new_url = params['url']
    # b) connect to our test database (like if ENV['ENVIRONEMENT'] = 'test' when we run RSpec)
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # c) insert the new piece of data 'url' in our test database
    connection.exec("INSERT INTO bookmarks_test (url) VALUES('#{new_url}')")
    # d) redirect back to '/bookmarks'
    redirect '/bookmarks'
  end

  # post '/bookmarks/saved' do
  #   url = params['url']
  #   connection = PG.connect(dbname: 'bookmark_manager_test')
  #   connection.exec("INSERT INTO bookmarks_test (url) VALUES('#{url}')")
  #   redirect '/bookmarks'
  # end

  run! if app_file == $0
end
