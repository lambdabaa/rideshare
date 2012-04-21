require 'net/http'
require 'json'

module LocationsHelper

	# Takes a string location and returns a hash with the latitude and longitude in the form {"lat" => lat, "lng" => lng}
	def latlngFinder(location)
		
		# Tries to standardize input to a format that google maps likes
		location = location.strip().gsub(/\s+/, ",")

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
