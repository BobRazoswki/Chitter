require 'data_mapper'
require 'sinatra'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}") #, "dbtype://user:password@hostname:port/databasename"

require './lib/link' # this needs to be done after datamapper is initialised
require './lib/tag'
DataMapper.finalize
DataMapper.auto_upgrade!

class BookMark < Sinatra::Base
	
	set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
  	@links = Link.all
    erb :index
  end

  post '/links' do
  	url = params[:url]
  	title = params[:title]
  	tags = params[:tags].split(" ").map do |tag|
  		Tag.first_or_create(:text => tag)
  	end

  	Link.create(:url => url, :title => title, :tags => tags)
  	redirect to('/')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end