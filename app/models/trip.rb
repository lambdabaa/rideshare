class Trip < ActiveRecord::Base
  belongs_to  :driver, :primary_key => "driver_id", :foreign_key => "user_id", :class_name => "User"
  has_many    :rides
  has_many    :passengers, :through => "rides"
  belongs_to  :start_location,  :primary_key => "start_location_id",  :class_name => "Location"
  belongs_to  :finish_location, :primary_key => "finish_location_id", :class_name => "Location"

  # TODO(gaye): Add validations
  
  def filter_by_date_and_start_and_finish_location(
    first_date,
    last_date,
    start_location,
    finish_location,
    max_start_distance_offset=0.5,
    max_finish_distance_offset=0.5)
    
    # TODO(gaye): We should be storing these redundantly in the db 
    # so we don't have to do these linear time filterings
    trips = Trip.where("departure between #{first_date} and #{last_date}")
    trips.delete_if {|trip| 
        Location.distance(start_location, trip.start_location) > max_start_distance_offset}
    trips.delete_if {|trip|
        Location.distance(finish_location, trip.finish_location) > max_finish_distance_offset}
    
    # TODO(gaye): Maybe sort by proximity on the filtered list
  end
  
  # Takes a string location and returns a hash with the latitude and longitude in the form {"lat" => lat, "lng" => lng}
	def self.latlngFinder(location)
		# Tries to standardize input to a format that google maps likes
  	location = location.strip().gsub(/\s+/,"+")
		# Makes a call to the google maps api
		response= Net::HTTP.get(URI("http://maps.googleapis.com/maps/api/geocode/json?address=#{location}&sensor=false"))
		# Parses the JSON results
		result = JSON.parse(response)
		lat = result ["results"][0]["geometry"]["location"]["lat"]
		lng = result ["results"][0]["geometry"]["location"]["lng"]

		latlng = {"lat" => lat, "lng" => lng}
		return latlng
	end
end
