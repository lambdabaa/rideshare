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
    params[:trip][:start_location_id] = Location.get_location(params[:trip].delete(:start_location)).id
    params[:trip][:finish_location_id] = Location.get_location(params[:trip].delete(:finish_location)).id

    @trip = Trip.new(params[:trip])
    
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
