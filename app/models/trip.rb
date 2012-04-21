class Trip < ActiveRecord::Base
  belongs_to  :driver, :primary_key => "driver_id", :foreign_key => "user_id", :class_name => "User"
  has_many    :rides
  has_many    :passengers, :through => "rides"
  belongs_to  :start_location,  :primary_key => "start_location_id",  :class_name => "Location"
  belongs_to  :finish_location, :primary_key => "finish_location_id", :class_name => "Location"

  # TODO(gaye): Add validations

  validates :driver_id, :numericality => true,
			:presence => true  # every trip needs a driver

  validates :start_location_id, :numericality => true
  validates :finish_location_id, :numericality => true
# validates :description, :length => {:maximum => 140} # twitter style max length?
  validates :cost, :numericality => true

end
