class Space < ActiveRecord::Base
  belongs_to :users

  def self.fetch_email
    @spaces = Space.all
    @spaces.each do | space |
      User.joins("INNER JOIN spaces ON spaces.user_id = users.id AND spaces.id = '#{space.id}'").first

      # user = User.find("#{space.user_id}")
      # space[:email] = user.email
      # space[:email] = Space.where(["#{space.user_id}", space.id]).first
    end
  end
end
