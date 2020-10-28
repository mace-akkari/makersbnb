require 'pg'
require_relative './../database_connection'
require_relative './../models/space.rb'

class MakersBNB < Sinatra::Base
  set :root, File.dirname(File.expand_path("..", __FILE__))
  session_secret
  set :session_secret, "ENV"
  enable :sessions, :method_override
  register Sinatra::Flash

  get "/" do
    redirect "/spaces"
  end

  get "/users/new" do
    erb :'users/new'
  end

  post "/users" do
    user = User.create(username: params["username"], email: params["email"], full_name: params["full_name"], password: params["password"])
    session["user_id"] = user.id
    flash.next[:notice] = "Welcome #{params["username"]}"
    redirect "/"
  end

  get "/sessions/new" do
    erb :'sessions/new'
  end

  post "/sessions" do
    user = User.find_by_email(params["email"])
    if user.password == params["password"]
      session["user_id"] = user.id
      flash.next[:notice] = "Welcome back, #{user.username}"
      redirect "/spaces"
    else
      redirect "/sessions/new"
    end
  end

  delete "/sessions/:id" do
    session["user_id"] = nil
    flash.next[:notice] = "Successfully logged out"
    redirect "/"
  end

  get "/spaces" do
    @user = User.find(session["user_id"]) unless session["user_id"].nil?
    @spaces = Space.all
    erb :spaces
  end

  post "/spaces" do
    Space.create(description: params[:description], location: params[:location], availability: params[:availability], price: params[:price], user_id: session[:user_id])
    redirect "/spaces"
  end

  get "/spaces/new" do
    erb :form
  end


end
