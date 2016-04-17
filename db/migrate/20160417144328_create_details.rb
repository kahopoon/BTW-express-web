class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :order_id, :index=>true
      t.integer :weight
      t.string :photo
      t.text :discription
      t.integer :prepay
      t.integer :fee
      t.timestamps null: false
    end
  end
end
