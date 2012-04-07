class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.references :trip
      t.references :passenger
      
      t.timestamps
    end
    
    add_index :rides, :trip_id
    add_index :rides, :passenger_id
  end
end
