require 'test_helper'

class TripTest < ActiveSupport::TestCase
 test "trip attributes must not be empty" do
	trip = Trip.new
	assert trip.invalid?
	assert trip.errors[:date].any?
	assert trip.errors[:time].any?	# one of the time ranges we set up
	assert trip.errors[:location_start].any?
	assert trip.errors[:location_finish].any?
	assert trip.errors[:driver].any?  # should always be the posting user..
	assert trip.errors[:seats_available].any?
	assert trip.errors[:cost_trip].any? # gas, mileage, etc. calculated by us
	assert trip.errors[:cost_seat].any? # additional fee set by user (can be $0)
 end
end
