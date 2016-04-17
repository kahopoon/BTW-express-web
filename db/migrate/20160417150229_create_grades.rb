class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :owner
      t.integer :courier
      t.integer :order_id, :index=>true
      t.timestamps null: false
    end
  end
end
