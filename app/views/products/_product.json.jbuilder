json.extract! product, :id, :item, :content, :image_name, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
