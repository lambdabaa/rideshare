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
  
  test "should update an existing user with any changes" do
    auth2 = { "provider" => 'facebook', "uid" => '122', "info" => {"name" => 'Frank', "urls" => {"Facebook" => 'new_url'}, "image" =>'new_image' }}
    new_user = User.update_with_omniauth(auth2)
    assert_equal(new_user.name, 'Frank')
    assert_equal(new_user.provider, 'facebook')
    assert_equal(new_user.uid, '122')
    assert_equal(new_user.url, 'new_url')
    assert_equal(new_user.image, 'new_image')
  end
end
