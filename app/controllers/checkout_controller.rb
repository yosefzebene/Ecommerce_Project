class CheckoutController < ApplicationController

  def confirmorder
    session[:cart] = {}

    redirect_to root_path
  end

  def cancelorder
    Order.find(session[:order_id]).destroy
    redirect_to show_cart_path
  end

  def stripe_checkout
    # do tax stuff with the location
    customer = Customer.find(current_customer.id)

    cart = fetch_cart

    items = build_products_price_data(cart)
    create_order(customer, cart)

    session = Stripe::Checkout::Session.create({
                                                 customer_email: customer.email,
                                                 line_items:     items,
                                                 mode:           "payment",
                                                 success_url:    "#{checkout_success_url}?session_id={CHECKOUT_SESSION_ID}",
                                                 cancel_url:     checkout_cancel_url
                                               })

    redirect_to session.url, allow_other_host: true
  end

  private

  def fetch_cart
    cart = {}

    session[:cart].each do |id, quantity|
      product = Product.find(id.to_i)
      cart[product] = quantity
    end

    cart
  end

  def build_products_price_data(cart)
    items = []

    cart.each do |product, quantity|
      items << {
        price_data: {
          currency:            "cad",
          product_data:        {
            name: product.name
          },
          unit_amount_decimal: (product.discount? ? product.discount_price : product.price_in_dollar) * 100
        },
        quantity:   quantity
      }
    end

    # Get tax rates
    location = Location.find(params[:location])
    tax_rate = location.region.tax_rate

    # Add GST
    items << {
      price_data: {
        currency:            "cad",
        product_data:        {
          name: "GST"
        },
        unit_amount_decimal: (Product.calculate_subtotal(cart) * (tax_rate.GST / 100)).round(2) * 100
      },
      quantity:   1
    }

    # Add PST
    items << {
      price_data: {
        currency:            "cad",
        product_data:        {
          name: "PST"
        },
        unit_amount_decimal: (Product.calculate_subtotal(cart) * (tax_rate.PST / 100)).round(2) * 100
      },
      quantity:   1
    }

    # Add HST
    items << {
      price_data: {
        currency:            "cad",
        product_data:        {
          name: "HST"
        },
        unit_amount_decimal: (Product.calculate_subtotal(cart) * (tax_rate.HST / 100)).round(2) * 100
      },
      quantity:   1
    }

    items
  end

  def create_order(customer, cart)
    # Get tax rates
    location = Location.find(params[:location])
    tax_rate = location.region.tax_rate

    status = Status.find_by(name: "New")
    subtotal = Product.calculate_subtotal(cart)
    pst = (subtotal * (tax_rate.PST / 100)).round(2) * 100
    gst = (subtotal * (tax_rate.GST / 100)).round(2) * 100
    hst = (subtotal * (tax_rate.HST / 100)).round(2) * 100

    order = customer.orders.create(status_id: status.id, PST: pst, GST: gst, HST: hst, subtotal: subtotal * 100)

    cart.each do |product, quantity|
      order.order_products.create(product_id: product.id, quantity: quantity, singleprice: product.price)
    end

    session[:order_id] = order.id
  end
end
