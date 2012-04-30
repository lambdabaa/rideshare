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
          
    new_params[:start_location_id] = Location.get_location(start_string).id
    new_params[:finish_location_id] = Location.get_location(end_string).id

    @trip = Trip.new(new_params)
    
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, :notice => "Created a new trip" }
      else
        format.html { render :action => 'new' }
      end
    end 
  end
  
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_url, :notice => "You totally annihilated that trip!"
  end
end
