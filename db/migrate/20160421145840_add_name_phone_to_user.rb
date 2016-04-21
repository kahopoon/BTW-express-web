class AddNamePhoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :integer
    add_column :users, :fake_name, :string
  end
end
