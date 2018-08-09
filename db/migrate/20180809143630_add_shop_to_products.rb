class AddShopToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :shop, :string
  end
end
