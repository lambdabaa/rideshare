require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
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
  
  # TODO(gaye): Test Location.distance
end
