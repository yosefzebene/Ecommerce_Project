class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])

    redirect_to root_path unless customer_signed_in? && current_customer.id == @order.customer_id

    @order_products = @order.order_products
    @location = @order.customer.locations.first
  end
end
