require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  # TODO(gaye): Uncomment this once the facebook code is unbroken
  # test "index without params gives success" do
  #   get :index
  #   assert_response :success
  # end
  
  # TODO(gaye): Test search
  
  # TODO(gaye): Uncomment this once the facebook code is unbroken
  # test "show gives success" do
  #   trip = trips(:middlebury_to_boston)
  #   get :show, :id => trip.id
  #   assert_response :success
  # end
  
  test "new gives success" do
    get :new
    assert_response :success
  end
end
