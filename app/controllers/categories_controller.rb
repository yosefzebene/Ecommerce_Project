class CategoriesController < ApplicationController
  def index
    @categories = Category.all.page(params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @products_in_category = @category.products.where(isactive: true).page(params[:page])
  end
end
