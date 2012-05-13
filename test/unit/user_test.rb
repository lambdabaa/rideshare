require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @auth = { "provider" => 'facebook', "uid" => '122', "info" => {"name" => 'Tommy Jones', "urls" => {"Facebook" => 'facebook_link'}, "image" =>'image_link' }}
    @tommy=users(:tommy)
  end
  
  test "should create a new user if one doesn't already exist" do
    #Delete tommy
    database_entry = User.find_by_uid(@tommy.uid)
    database_entry.destroy
    assert_nil(User.find_by_provider_and_uid(@auth["provider"], @auth["uid"]))
    #Create tommy 
    new_entry = User.create_with_omniauth(@auth)
    assert_equal(new_entry.name, @tommy.name)
    assert_equal(new_entry.provider, @tommy.provider)
    assert_equal(new_entry.uid, @tommy.uid)
    assert_equal(new_entry.url, @tommy.url)
    assert_equal(new_entry.image, @tommy.image)
  end
  
  test "should find past user from the database" do
    user = User.find_by_provider_and_uid(@auth["provider"], @auth["uid"])
    assert_equal(user.name, @tommy.name)
    assert_equal(user.provider, @tommy.provider)
    assert_equal(user.uid, @tommy.uid)
    assert_equal(user.url, @tommy.url)
    assert_equal(user.image, @tommy.image)
  end
end
