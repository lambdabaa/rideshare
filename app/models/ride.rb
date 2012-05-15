# Rides connect the User and Trip models in a many-to-many relationship
# Passengers can take many trips and trips can have many passengers
class Ride < ActiveRecord::Base
  belongs_to :trip
  belongs_to :passenger, :primary_key => "passenger_id", :foreign_key => "user_id", :class_name => "User"

  validates :trip_id, :numericality => true
  validates :passenger_id, :numericality => true
end
