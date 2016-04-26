class ChangeUserPhoneType < ActiveRecord::Migration
  def self.up
    change_column :users, :phone, :string
    remove_column :orders, :fake_user_name
    remove_column :orders, :fake_phone
    remove_column :users, :fake_name    
    add_column :users, :fullname, :string
  end

  def self.down
    change_column :users, :phone, :integer
    add_column :users, :fake_name, :string    
    add_column :orders, :fake_user_name, :string
    add_column :orders, :fake_phone, :integer    
	  remove_column :users, :fullname    
  end
end
