class CreateMsgqueues < ActiveRecord::Migration
  def change
    create_table :msgqueues do |t|
      t.integer :order_id
      t.integer :owner_id
      t.integer :courier_id
      t.string :goal

      t.timestamps null: false
    end
  end
end
