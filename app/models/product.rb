class Product < ApplicationRecord
    mount_uploader :picture, PictureUploader
    validates :item, {presence: true, length: {maximum: 100}}
    validates :content, {presence: true, length: {maximum: 500}}
    validates :shop, presence: true
    validates :price, presence: true
    validates :picture, presence: true

    def self.search(search)
        if search
            Product.where(["item Like or shop Like or price Like?","%#{search}%"])
        else
            Product.all
            respond_to do |format|
                format.html { redirect_to :index, notice: '正しい検索項目を入力してください' }
                format.json { render json: @product.errors, status: :unprocessable_entity }
            end
        end
    end
end
