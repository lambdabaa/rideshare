class Location < ActiveRecord::Base
  has_many :trips_starting_at,  :foreign_key => "start_location_id",  :class_name => "Trip"
  has_many :trips_finishing_at, :foreign_key => "finish_location_id", :class_name => "Trip"
  
  # TODO(gaye): Add validations

  validates :name, :presence => true, 
 	        :length => {:maximum => 50} #might not be necessary if implement autocomplete

  validates :latitude, :numericality => true,
		    :greater_than_or_equal_to => -90,
		    :less_than_or_equal_to => 90

  validates :longitude, :numericality => true,
		    :greater_than_or_equal_to => -180,
		    :less_than_or_equal_to => 180
  
  # TODO(bayers): Add validations for datetimes
  
end
