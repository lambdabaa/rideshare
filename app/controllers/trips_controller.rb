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
    start_location = params[:id][:start_location]
    
  end
  
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_url, :notice => "You totally annihilated that trip!"
  end
end
