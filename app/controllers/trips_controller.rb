class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end
  
  def show
    @trip = Trip.find(params[:id])
  end
  
  def new
    @trip = Trip.new
  end
  
  def edit
    @trip = Trip.find(params[:id])
  end
  
  def create
    start_string = params["trip"][:start_location]
    end_string = params["trip"][:finish_location]   
    
    new_params = params["trip"].clone
    new_params.delete("start_location")
    new_params.delete("finish_location")    
          
    new_params[:start_location_id] = get_location(start_string).id
    new_params[:finish_location_id] = get_location(end_string).id

    @trip = Trip.new(new_params)
    
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, :notice => "Created a new trip" }
      else
        format.html { render :action => 'new' }
      end
    end 
  end
  
  def get_location(string)
    location = Location.find_by_name(string)
    if (!location) 
      latlng = latlngFinder(string)
      p "latlng: "
      puts latlng
      Location.create(:name => string, :latitude => latlng["lat"], :longitude => latlng["lng"]) 
      location = Location.find_by_name(string)
    end
    location
  end
  
  # Takes a string location and returns a hash with the latitude and longitude in the form {"lat" => lat, "lng" => lng}
	def latlngFinder(location)
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
	
  
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_url, :notice => "You totally annihilated that trip!"
  end
end
