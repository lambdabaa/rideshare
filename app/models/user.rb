class User < ActiveRecord::Base
  has_many :trips

  def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["name"]
    user.url = auth["info"]["urls"]["Facebook"]
    user.image = auth["info"]["image"]
    end
  end
end
