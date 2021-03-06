class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  #登録された商品情報一覧と他のpageへのリンク
  def index
    @products = Product.all
  end
  
  #検索結果一覧表示
  def search
    @products = Product.search(params[:search])
    respond_to do |format|
      format.html { redirect_to @product, notice: '検索結果一覧' }
      format.json { render :show, status: :done, location: @product }
    end
  end
  

  # GET /products/1
  # GET /products/1.json
  #個々の商品詳細ページ表示
  def show
    #すでにset_productで@Productの情報取得
  end

  #read new input info→form（→create)
  # GET /products/new
  def new
    @product = Product.new
  end
  
  #read new info to edit//title,or content,or shop→form（→uodate)
  # GET /products/1/edit
  def edit
    #すでにset_productで@Productの情報取得
  end


  #form→
  # POST /products
  # POST /products.json
  def create
    @product = Product.new
    respond_to do |format|
      if @product.save!
        format.html { redirect_to @product, notice: '商品登録が完了しました' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  #form→
  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|#responseの形式で分岐(html/json)
      #Progateのチュートリアルで画像投稿練習をしたときのものです。
      #この時はすでにPublicフォルダに画像があることが前提でした
      '''if params[:image]
        @product.image_name = "#{@product.id}.jpg"
        image = params[:image]
        File.binwrite("public/product_images/#{@product.image_name}", image.read)
      end
      '''

      if @product.update(product_params.permit(:item,:content,:price,:picture)) #:picture_cache, :remove_picture))
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