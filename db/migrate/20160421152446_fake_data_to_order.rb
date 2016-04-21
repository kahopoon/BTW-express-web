class FakeDataToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :fake_user_name, :string
    add_column :orders, :fake_phone, :integer
  end
end
