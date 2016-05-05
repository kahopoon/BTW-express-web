class AddPictureToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_pic, :string
    remove_column :users, :fb_img
  end
end
