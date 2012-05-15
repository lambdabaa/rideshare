require 'test_helper'

class TripTest < ActiveSupport::TestCase
  test "filter works appropriately" do
    trip1 = trips(:middlebury_to_boston)
    trip2 = trips(:boston_to_middlebury)
    start = locations(:middlebury)
    finish = locations(:boston)
    trips = Trip.filter_by_date_and_start_and_finish_location(
      trip1.departure - 60 * 60 * 24,
      trip1.departure + 60 * 60 * 24,
      trip1.start_location,
      trip1.finish_location)
    assert(trips.include?(trip1))
    assert(!trips.include?(trip2))
  end
end
