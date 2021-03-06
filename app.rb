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

  post '/bookmarks/saved' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/deleting' do
    erb :'/bookmarks/deleting'
  end

  post '/bookmarks/deletion' do
    Bookmark.delete(title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/update' do
    erb :'/bookmarks/update'
  end

  post '/bookmarks/updater' do
    Bookmark.update(title: params[:title],new_title: params[:new_title],url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
