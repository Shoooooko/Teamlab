class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :item
      t.text :content
      t.integer :price
      t.string :shop
      t.timestamps
    end
  end
end
