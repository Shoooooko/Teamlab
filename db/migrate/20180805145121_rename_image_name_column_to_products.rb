class RenameImageNameColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :Products, :Picture, :picture
  end
end
