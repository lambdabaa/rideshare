class User < ActiveRecord::Base
  has_many :trips
end
