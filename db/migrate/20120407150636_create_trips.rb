class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references  :driver
      t.references  :start_location
      t.references  :finish_location
      t.text        :description
      t.float       :cost
      t.datetime    :departure
      t.datetime    :arrival
      
      t.timestamps
    end
    
    add_index :trips, :driver_id
    add_index :trips, :start_location_id
    add_index :trips, :finish_location_id
  end
end
