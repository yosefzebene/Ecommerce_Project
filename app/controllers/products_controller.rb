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
    redirect_to products_path and return if params[:search].blank?

    @products = params[:category].blank? ? search_products : search_products_in_category
  end

  private

  def search_products_in_category
    parameter = params[:search].downcase
    category = Category.find(params[:category])

    category.products.activeproducts.where("lower(name) LIKE ?",
                                           "%#{parameter}%").page(params[:page])
  end

  def search_products
    parameter = params[:search].downcase

    Product.activeproducts.where("lower(name) LIKE ?",
                                 "%#{parameter}%").page(params[:page])
  end
end
