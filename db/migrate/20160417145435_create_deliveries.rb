class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.datetime :time    	
      t.text :address
      t.string :lat
      t.string :lng
      t.integer :detail_id, :index=>true
      t.timestamps null: false
    end
  end
end
