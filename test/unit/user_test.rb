require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "should create a new user if one doesn't already exist" do
    auth = { "provider" => 'facebook', "uid" => '122', "info" => {"name" => 'Tommy Jones', "urls" => {"Facebook" => 'facebook_link'}, "image" =>'image_link' }}
    
    tommy=users(:tommy)
    #make sure it doesn't already exist
    database_entry = User.find_by_uid(tommy.uid)
    database_entry.destroy if (database_entry)
    
    new_entry = User.create_with_omniauth(auth)
    assert_equal(new_entry.name, tommy.name)
    assert_equal(new_entry.provider, tommy.provider)
    assert_equal(new_entry.uid, tommy.uid)
    assert_equal(new_entry.url, tommy.url)
    assert_equal(new_entry.image, tommy.image)
  end
end
