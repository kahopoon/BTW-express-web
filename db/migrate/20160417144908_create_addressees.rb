class CreateAddressees < ActiveRecord::Migration
  def change
    create_table :addressees do |t|
      t.string :mobile
      t.string :name
      t.integer :detail_id, :index=>true
      t.timestamps null: false
    end
  end
end
