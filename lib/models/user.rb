require "bcrypt"

class User < ActiveRecord::Base
  has_many :spaces
  include BCrypt

  def raw_password
    @password ||= Password.new(password)
  end

  def raw_password=(new_password)
    @password = Password.create(new_password)
    self.password = @password
  end
end
