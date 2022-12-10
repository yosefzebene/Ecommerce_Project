class CustomerController < ApplicationController
  def profile_options; end

  def list_orders
    customer = Customer.find(current_customer.id)

    @orders = customer.orders.all.order(created_at: :desc)
  end
end
