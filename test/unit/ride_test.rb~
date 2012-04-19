require 'test_helper'

class RideTest < ActiveSupport::TestCase
 test "ride attributes must not be empty" do
  	ride = Ride.new
	assert ride.invalid?
	assert ride.errors[:date].any? # let it be a range?
	assert ride.errors[:time].any?	# need multiple ranges for flexibility
	assert ride.errors[:location_start].any?
	assert ride.errors[:location_finish].any?
	assert ride.errors[:rider].any?  # should always be the posting user..
	assert ride.errors[:purpose].any? # could be nil? could make driver feel better
	assert ride.errors[:money_offer].any? # can offer payment to driver
 end
end
