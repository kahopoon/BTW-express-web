class AddPhotoToOrders < ActiveRecord::Migration
  def change
    add_attachment :orders, :photo
  end
end
