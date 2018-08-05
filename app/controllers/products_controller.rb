class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  #商品一覧ページ表示→show
  def index
    @products = Product.all
  end
  
  def search
    @products = Product.search(params[:search])
  end
  

  # GET /products/1
  # GET /products/1.json
  def show
    #すでにset_productで@Productの情報取得
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    #すでにset_productで@Productの情報取得
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: '商品登録が完了しました' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|#responseの形式で分岐(html/json)
      '''if params[:image]
        @product.image_name = "#{@product.id}.jpg"
        image = params[:image]
        File.binwrite("public/product_images/#{@product.image_name}", image.read)
      end
      '''

      if @product.update(product_params.permit(:item,:content,:price,:picture, :picture_cache, :remove_picture)
        format.html { redirect_to @product, notice: '商品情報が変更されました' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: '商品情報が削除されました' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:item, :content, :shop, :price, :picture, :picture_cache, :remove_picture)
    end
end