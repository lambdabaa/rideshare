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
  
  test "trip should have a cost" do
    trip = trips(:middlebury_to_boston)
    trip.cost = nil
    saved = trip.save
    assert !saved, "trip should have a non-nil cost"
  end
  
  test "trip should have a numerical cost" do
    trip = trips(:middlebury_to_boston)
    trip.cost = "some string"
    saved = trip.save
    assert !saved, "trip should have a numerical cost"
  end
  
  test "trip should have a driver or passenger" do
    trip = trips(:middlebury_to_boston)
    trip.has_driver = nil
    saved = trip.save
    assert !saved, "trip should set driver boolean"
  end
  
  test "trip should have a start location" do
    trip = trips(:middlebury_to_boston)
    trip.user = nil
    saved = trip.save
    assert !saved, "trip should have a start location"
  end
  
  test "trip should have a finish location" do
    trip = trips(:middlebury_to_boston)
    trip.user = nil
    saved = trip.save
    assert !saved, "trip should have a finish location"
  end
end
