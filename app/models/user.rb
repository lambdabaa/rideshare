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
  
  def self.update_with_omniauth(auth)
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
    if user.provider != auth["provider"]
      user.provider = auth["provider"]
    end
    if user.uid != auth["uid"]
      user.uid = auth["uid"]
    end
    if user.name != auth["info"]["name"]
      user.name = auth["info"]["name"]
    end
    if user.url != auth["info"]["urls"]["Facebook"]
      user.url = auth["info"]["urls"]["Facebook"]
    end
    if user.image != auth["info"]["image"]
      user.image = auth["info"]["image"]
    end
  return user
  end
end
