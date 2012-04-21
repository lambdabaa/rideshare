class User < ActiveRecord::Base
  has_many :trips_as_driver,  :foreign_key => "driver_id",    :class_name => "Trip"
  has_many :rides,            :foreign_key => "passenger_id"

  # TODO(gaye): There's a bug in the relation below
  # has_many :trips_as_passenger, :through => "rides", :foreign_key => "trip_id", :class_name => "Trip"
  
  # TODO(gaye): Add validations

end
