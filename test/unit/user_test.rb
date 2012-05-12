require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "should create a new user if one doesn't already exist" do
    auth = { "provider" => 'facebook', "uid" => '122', "info" => {"name" => 'Brian Ayers', "urls" => {"Facebook" => 'facebook_link'}, "image" =>'image_link' }}
    
    b = users(:brian)
    #make sure it doesn't already exist
    database_entry = User.find_by_uid(b.uid)
    database_entry.destroy if (database_entry)
    
    User.find_by_provider_and_uid(b.provider, b.uid)
    new_entry = User.create_with_omniauth(auth)
    assert_equal(new_entry.name, b.name)
    assert_equal(new_entry.provider, b.provider)
    assert_equal(new_entry.uid, b.uid)
    assert_equal(new_entry.url, b.url)
    assert_equal(new_entry.image, b.image)
  end
end
