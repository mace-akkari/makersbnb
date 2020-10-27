require 'pg'
require_relative './../database_connection'
require_relative './../models/space.rb'

class MakersBNB < Sinatra::Base
  set :root, File.dirname(File.expand_path("..", __FILE__))
  enable :sessions
  session_secret
  set :session_secret, "ENV"
  # register Sinatra::Flash
  
  get "/" do
    erb :index
  end

  get "/spaces" do
    # @username = User.find(session[:])
    @spaces = Space.all
    erb :spaces
  end

  post "/spaces" do
    Space.create(description: params[:description], location: params[:location], availability: params[:availability])
    redirect "/spaces"
  end

  get "/spaces/new" do
    erb :form
  end


end
