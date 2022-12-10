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
    session[:cart][params[:id]] = params[:quantity].to_i
    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    session[:cart].delete(params[:id].to_s)
    redirect_back(fallback_location: root_path)
  end

  def show_cart
    @cart = {}

    session[:cart].each do |id, quantity|
      product = Product.find(id.to_i)
      @cart[product] = quantity
    end

    return unless customer_signed_in?

    @location = Location.where(customer_id: current_customer.id).first
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
    session[:cart] ||= {}
  end

  def load_cart
    @cart = session[:cart]
  end
end
