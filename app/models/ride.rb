# Rides connect the User and Trip models in a many-to-many relationship
# Passengers can take many trips and trips can have many passengers
class Ride < ActiveRecord::Base
  belongs_to :trip
  belongs_to :passenger, :foreign_key => "passenger_id", :class_name => "User"
  
  # TODO(gaye): Add validations
end
