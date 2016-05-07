class AddPhotoColumn < ActiveRecord::Migration
  def up
    add_attachment :users, :user_photo
  end

  def down
    remove_attachment :users, :user_photo
  end
  
end
