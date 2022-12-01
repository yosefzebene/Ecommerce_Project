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

  def search
    if params[:search].blank?
      redirect_to products_path and return
    else
      parameter = params[:search].downcase

      if params[:category].blank?
        @products = Product.activeproducts.where("lower(name) LIKE ?", "%#{parameter}%").page(params[:page])
      else
        category = Category.find(params[:category])

        @products = category.products.activeproducts.where("lower(name) LIKE ?", "%#{parameter}%").page(params[:page])
      end
    end
  end
end
