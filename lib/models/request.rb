class Request < ActiveRecord::Base
  def username
    requests = User.joins("INNER JOIN requests ON users.id = requests.user_id AND users.id = #{user_id}")
    request = requests.first
    request.username
  end

  def description
    requests = Space.joins("INNER JOIN requests ON spaces.id = requests.space_id AND spaces.id = #{space_id}")
    request = requests.first
    request.description
  end

  def landlord_id
    spaces = Space.joins("INNER JOIN requests ON spaces.id = requests.space_id AND spaces.id = #{space_id}")
    space = spaces.first
    space.user_id
  end
end
