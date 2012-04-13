require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user attributes must not be empty" do
	user = User.new
	assert user.invalid?
	assert user.errors[:name_first].any?
	assert user.errors[:name_last].any?
	assert user.errors[:email].any? # check it is middlebury.edu in validator
	assert user.errors[:password].any?
	# sign in using facebook?
 end
end
