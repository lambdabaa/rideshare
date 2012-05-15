class Trip < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :start_location,  :foreign_key => "start_location_id",  :class_name => "Location"
  belongs_to  :finish_location, :foreign_key => "finish_location_id", :class_name => "Location"

  validates :has_driver, :presence => true
  validates :cost, :presence => true, :numericality => true 
  validates :start_location, :presence => true
  validates :finish_location, :presence => true
  
  def self.filter_by_date_and_start_and_finish_location(
    first_date,
    last_date,
    start_location,
    finish_location,
    max_start_distance_offset=0.5,
    max_finish_distance_offset=0.5)
    
    trips = Trip.where(:departure => first_date..last_date)
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
		begin
		  lat = result ["results"][0]["geometry"]["location"]["lat"]
		  lng = result ["results"][0]["geometry"]["location"]["lng"]
		  
		  latlng = {"lat" => lat, "lng" => lng}
		  return latlng
		rescue NoMethodError
		  return nil
	  end
	end
end
