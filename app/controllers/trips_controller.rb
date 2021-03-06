class TripsController < ApplicationController
  def index
    if params[:search]
      start_location = Location.get_location(params[:start_location])
      finish_location = Location.get_location(params[:finish_location])
      
      @trips = Trip.filter_by_date_and_start_and_finish_location(
          Date.new(
              params[:search]['first_date(1i)'].to_i,
              params[:search]['first_date(2i)'].to_i,
              params[:search]['first_date(3i)'].to_i),
          Date.new(
             params[:search]['last_date(1i)'].to_i,
             params[:search]['last_date(2i)'].to_i,
             params[:search]['last_date(3i)'].to_i),
          start_location,
          finish_location,
          params[:search][:max_start_distance_offset] || 0.5,
          params[:search][:max_finish_distance_offset] || 0.5)
    else
      @trips = Trip.where("departure > ?", Time.now)
    end
    
    respond_to do |format|
      format.html
      format.json { render :json => @trips }
    end
  end
  
  def show
    @trip = Trip.find(params[:id], :include => :user)
  end
  
  def new
    @trip = Trip.new
  end
  
  def edit
    @trip = Trip.find(params[:id])
  end
  
  def create
    start_location = Location.get_location(params[:trip].delete(:start_location))
    end_location = Location.get_location(params[:trip].delete(:finish_location))
    valid = false;
    
    if (start_location && end_location)
      params[:trip][:start_location_id] = start_location.id
      params[:trip][:finish_location_id] = end_location.id
      params[:trip][:user] = current_user
      valid = true
    end
    @trip = Trip.new(params[:trip])
    @trip.errors.add(:start_location, "Invalid location entered") unless (valid)
    respond_to do |format|
      if @trip.save && valid
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
