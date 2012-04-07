require 'test_helper'

class UserRideTripTest < ActiveSupport::TestCase
  test "relations between users, rides, and trips" do
    # TODO(gaye): Replace the assert(!...) calls here with whatever
    # the correct negation is for ActiveSupport:TestCase
    # TODO(gaye): Once we figure out the trips_as_passenger association,
    # replace the rides assertions with trips_as_passenger assertions
    u1 = User.create!
    u2 = User.create!
    t = Trip.create!(:driver_id => u1.id)
    r = Ride.create!(:passenger_id => u2.id)
    assert(u1.trips_as_driver.include?(t))
    assert(!u2.trips_as_driver.include?(t))
    assert(u2.rides.include?(r))
    assert(!u1.rides.include?(r))
  end
end
