require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  test "index without params gives success" do
    get :index
    assert_response :success
  end
  
  test "show gives success" do
    trip = trips(:middlebury_to_boston)
    get :show, :id => trip.id
    assert_response :success
  end
  
  test "new gives success" do
    get :new
    assert_response :success
  end
end
