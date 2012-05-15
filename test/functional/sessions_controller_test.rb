require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def setup
    @controller = SessionsController.new
  end
  
  # tests to make sure the facebook callback gets routes to the create method in sessions
  def test_routes
    assert_routing '/auth/:provider/callback', { :controller => 'sessions', :action => 'create', :provider => ':provider' }
  end
    
end
