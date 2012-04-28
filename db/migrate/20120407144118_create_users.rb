class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # TODO(gaye): Add college credentials & integrate with exchange server
      
	  t.string :provider
      t.string :uid	
      t.string :name
      
      t.timestamps
    end
  end
end
