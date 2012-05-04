class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references  :user
      t.references  :start_location
      t.references  :finish_location
      t.float       :cost
      t.date        :departure
      t.boolean     :has_driver
      
      t.timestamps
    end
    
    add_index :trips, :user_id
    add_index :trips, :start_location_id
    add_index :trips, :finish_location_id
  end
end
