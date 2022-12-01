class ProductsController < ApplicationController
  def index
    @products = Product.activeproducts.page(params[:page])
  end

  def show
    @product = Product.activeproducts.find(params[:id])
  end

  def onsale
    @products = Product.onsale.page(params[:page])
  end

  def newproducts
    @products = Product.newproducts.page(params[:page])
  end
end
