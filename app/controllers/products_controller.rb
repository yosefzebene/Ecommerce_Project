class ProductsController < ApplicationController
  def index
    @products = Product.where(isactive: true)
  end

  def show
    @product = Product.where(isactive: true).find(params[:id])
  end
end
