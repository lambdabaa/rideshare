class ChangeDateFormatInTrips < ActiveRecord::Migration
  def self.up
   change_column :trips, :departure, :datetime
  end

  def self.down
   change_column :trips, :departure, :date
  end
end