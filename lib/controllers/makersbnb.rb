require "pg"
require_relative "./../database_connection"
require_relative "./../models/space.rb"

class MakersBNB < Sinatra::Base
  set :root, File.dirname(File.expand_path("..", __FILE__))
  set :public_folder, Proc.new { File.join(root, "../public") }
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
    @user = User.new(username: params["username"], email: params["email"], full_name: params["full_name"])
    @user.raw_password = params["password"]
    @user.save!
    session["user_id"] = @user.id
    flash.next[:notice] = "Welcome #{params["username"]}"
    redirect "/"
  end

  get "/sessions/new" do
    erb :'sessions/new'
  end

  post "/sessions" do
    @user = User.find_by_email(params["email"])
    if @user.raw_password == params["password"]
      session["user_id"] = @user.id
      flash.next[:notice] = "Welcome back, #{@user.username}"
      redirect "/spaces"
    else
      flash.next[:warning] = "Incorrect email/password"
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
    Space.create(description: params[:description], location: params[:location], start_date: params[:start_date], end_date: params[:end_date], price: params[:price], user_id: session[:user_id])
    redirect "/spaces"
  end

  get "/spaces/new" do
    erb :form
  end

  get "/requests" do
    @requests = Request.all
    @users_requests = @requests.select { |request| request.landlord_id == session["user_id"] }
    erb :'requests/index'
  end

  post "/requests" do
    @space_request = Request.create(user_id: session["user_id"], space_id: params[:space_id], date: params[:date], confirmed: false)
    erb :'requests/confirmation'
  end
end
