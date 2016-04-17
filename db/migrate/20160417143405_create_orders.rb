class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :owner_id, :index=>true
      t.integer :courier_id, :index=>true
      t.string :status

      t.timestamps null: false
    end
  end
end
