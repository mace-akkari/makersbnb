class Space < ActiveRecord::Base
  belongs_to :users

  def email
    users = User.joins("INNER JOIN spaces ON spaces.user_id = users.id AND spaces.id = '#{id}'")
    user = users.first
    user.email
  end
  
end
