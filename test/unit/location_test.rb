require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  DISTANCE = 2.6805612307924327
  
  test "should create a location if one doesn't already exist" do
    midd = locations(:middlebury)
    # make sure it doesn't already exist
    database_entry = Location.find_by_name(midd.name)
    database_entry.destroy if (database_entry)
    
    Location.get_location(midd.name)
    new_entry = Location.find_by_name(midd.name)
    assert_equal(new_entry.name, midd.name)
    assert_equal(new_entry.latitude, midd.latitude)          
    assert_equal(new_entry.longitude, midd.longitude)
  end
  
  test "should return the right distance" do
    midd = locations(:middlebury)
    boston = locations(:boston)
    assert_equal(DISTANCE, Location.distance(midd, boston))
  end
  
  test "must have a valid latitude" do
    location = locations(:middlebury)
    location.latitude = nil
    saved = location.save
    assert !saved, "trip should have a valid latitude"
  end
  
  test "must have a valid longitude" do
    location = locations(:middlebury)
    location.longitude = nil
    saved = location.save
    assert !saved, "trip should have a valid longitude"
  end
end
