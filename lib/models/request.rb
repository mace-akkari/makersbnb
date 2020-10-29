class Request < ActiveRecord::Base
  belongs_to :requests

  def user_id
    requests = Request.joins("INNER JOIN spaces ON spaces.id = requests.space_id AND spaces.user_id = #{@session["user_id"]}")
    request = requests.first
    request.user_id
  end

  def date
    requests = Request.joins("INNER JOIN spaces ON spaces.id = requests.space_id AND spaces.user_id = #{session["user_id"]}")
    request = requests.first
    request.date
  end
end