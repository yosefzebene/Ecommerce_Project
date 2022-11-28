class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products_in_category = @category.products.where(isactive: true)
  end
end
