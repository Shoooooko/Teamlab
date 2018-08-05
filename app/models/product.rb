class Product < ApplicationRecord
    mount_uploader :picture, PictureUploader
    validates :item, {presence: true, length: {maximum: 100}}
    validates :content, {presence: true, length: {maximum: 500}}
    validates :shop, presence: true
    validates :price, presence: true
end
