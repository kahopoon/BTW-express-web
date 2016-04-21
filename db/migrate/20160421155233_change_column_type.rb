class ChangeColumnType < ActiveRecord::Migration
  def self.up
    change_column :orders, :fake_phone, :string
  end

  def self.down
    change_column :orders, :fake_phone, :integer
  end
end
