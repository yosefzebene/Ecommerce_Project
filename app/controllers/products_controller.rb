class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

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

  def add_to_cart
    id = params[:id].to_i

    session[:cart] << id unless session[:cart].include?(id)
    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    id = params[:id].to_i

    session[:cart].delete(id)
    redirect_back(fallback_location: root_path)
  end

  def show_cart
    @cart = Product.find(session[:cart])
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

  def initialize_session
    session[:cart] ||= []
  end

  def load_cart
    @cart = session[:cart]
  end
end
