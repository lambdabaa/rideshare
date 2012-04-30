require 'test_helper'

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should return the correct latitude and longitude" do
    midd = locations(:middlebury)
    coordinates = Trip.latlngFinder(midd.name)
    latitude = coordinates["lat"]
    longitude = coordinates["lng"]    

    assert_equal(latitude, midd.latitude)
    assert_equal(longitude, midd.longitude)
  end
  # TODO(gaye): Test filter
end
