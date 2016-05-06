class AddNotifiedToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :notified, :string 	
  end
end
