class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :item
      t.text :content
      t.string :image_name
      t.integer :price

      t.timestamps
    end
  end
end