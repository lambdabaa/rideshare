require 'test_helper'

class LocationTest < ActiveSupport::TestCase
# not really sure how this is going to work, but this is our best guess
 test "location attributes must not be empty" do
  	location = Location.new
	assert location.invalid?
	assert location.errors[:type].any? # start or finish
	assert location.errors[:longitude].any?
	assert location.errors[:latitude].any?
	assert location.errors[:city].any? # next three depend on how you want to set it up
	assert location.errors[:state].any?
	# assert location.errors[:title].any?
 end 
end
