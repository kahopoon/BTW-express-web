class ModifyModels < ActiveRecord::Migration
  def change
  	add_column :orders, :pickup_time, :datetime
  	add_column :orders, :deliver_time, :datetime
  	add_column :orders, :pickup_addr, :text
  	add_column :orders, :deliver_addr, :text  	
  	add_column :orders, :pickup_latlng, :string
  	add_column :orders, :deliver_latlng, :string
  	add_column :orders, :name, :string
  	add_column :orders, :photo, :string
  	add_column :orders, :rate_owner, :integer
   	add_column :orders, :rate_courier, :integer


  	add_column :details, :addressees_mobile, :string
  	add_column :details, :addressees_name, :string  	
  	remove_column :details, :photo
  end
end
