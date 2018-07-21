 class ProductsController < ApplicationController
  
   before_action :user_pages
   before_action :authenticate_user!, except: [:index, :index_penalty] 
   before_action :set_product, only: [:show, :edit, :update, :destroy]
   
   # GET /products
   # GET /products.json
   def index
     @products = Product.all
      # @products = Product.page params[:page]
    @p = 1
   end
   
   def index_penalty
     @products = Product.all
     @p = 2
   end
 
   # GET /products/1
   # GET /products/1.json
   def show
    @user_likes_product = Like.where(user_id: current_user.id, product_id: @product.id).first if user_signed_in?
     if @product.area_type.eql?("흡연구역")
      @p = 1
     else @product.area_type.eql?("단속구역")
      @p = 2
     end
   end
 
   # GET /products/new
   def new
     @product = Product.new
     @p = 1
     
   end
 
   def new_penalty
     @product = Product.new
     @p = 2
   end
 
   # GET /products/1/edit
   def edit
   end
 

 
   # POST /products
   # POST /products.json
   def create
     @product = Product.new(product_params)
     @product.save
     if @product.area_type.eql?("흡연구역")
       redirect_to "/products"
        flash[:info] = '흡연구역이 등록되었습니다.'
     else
       redirect_to "/products/index_penalty"
       flash[:info] = '단속구역이 등록되었습니다.'
     end
   end
 
   # PATCH/PUT /products/1
   # PATCH/PUT /products/1.json
   def update

   @product.update(product_params)
   redirect_to "/smovesmoveadmin"

   end
 
   # DELETE /products/1
   # DELETE /products/1.json
   def destroy

     @product.destroy
     redirect_to "/smovesmoveadmin"
   
     
   end
   
   def new_map
   end
   def create_map
         u1 = Product.new
         u1.latitude =  session[:map_lat]
         u1.longitude = session[:map_lng]
         u1.area_name = params[:area_name]
         u1.address = params[:address]
         u1.save
         redirect_to "/"
   end
   
  def like_product
    #현재 유저와 params에 담긴 movie간의 좋아요 관계를 설정한다.
    @like = Like.where(user_id: current_user.id, product_id: params[:product_id]).first
    if @like.nil?
       @like=Like.create(user_id: current_user.id,product_id: params[:product_id])
    else
        @like.destroy
    #만약에 현재 로그인한 유저가 이미 좋아요를 눌렀을 경우
    #해당 Like 인스턴스 삭제
    end
  end
 
   private
     # Use callbacks to share common setup or constraints between actions.
     def set_product
       @product = Product.find(params[:id])
     end
 
     # Never trust parameters from the scary internet, only allow the white list through.
     def product_params
       params.require(:product).permit(:area_type,:area_name,:address,:latitude,:longitude,:description,:image_address)
     end
     
     def user_pages
       @user_pages = true
     end
     
 end
