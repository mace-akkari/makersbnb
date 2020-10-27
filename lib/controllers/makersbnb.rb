class MakersBNB < Sinatra::Base
  set :root, File.dirname(File.expand_path("..", __FILE__))
  enable :sessions
  register Sinatra::Flash

  get "/" do
    erb :index
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
      redirect "/"
    else
      redirect "/sessions/new"
    end
  end
end
