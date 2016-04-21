class FixTypo < ActiveRecord::Migration
  def change
  	add_column :details, :description, :text  	
  	remove_column :details, :discription  	
  end
end
