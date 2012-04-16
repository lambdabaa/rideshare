class TripsController < ApplicationController
  def index
    @trips = Trip.all
    # TODO(gaye): Replace this with an actual view
    render :text => @trips.to_json
  end
  
  def show
    @trip = Trip.find(params[:id])
    # TODO(gaye): Replace this with an actual view
    render :text => @trip.to_json
  end
end
