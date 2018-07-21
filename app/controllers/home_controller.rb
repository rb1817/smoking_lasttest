class HomeController < ApplicationController
  before_action :js_authenticate_user!, only: [:like_movie]
  before_action :authenticate_user!, except: [:index]
  before_action :user_pages
    
  def index
    @products = Product.all
    @p = Product.first
    @home = Home.all
  end

  
  
  
  private
  
  def user_pages
    @user_pages = true
  end
end
