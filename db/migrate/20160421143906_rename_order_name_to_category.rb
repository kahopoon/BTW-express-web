class RenameOrderNameToCategory < ActiveRecord::Migration
  def change
    rename_column :orders, :name, :category
  end
end
