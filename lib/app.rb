require "sinatra/base"
require "sinatra/activerecord"
require "sinatra/flash"

require_relative "database_connection"

require_relative "models/user"

require_relative "models/space"

require_relative "models/request"

require_relative "controllers/makersbnb"
