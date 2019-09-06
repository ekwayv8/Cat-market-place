class OrdersController < ApplicationController
before_action :authenticate_user!
 
  def new
  end

  def show
  end

  def create

    # STRIPE
    @amount = (current_user.cart.total_price * 100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

      # new order and cart
        new_order = Order.new
        new_order.user_id = current_user.id
        new_order.save

        current_user.cart.cart_items.each do |cart_item|
          ItemOrder.create(order_id: new_order.id, quantity: cart_item.quantity, item_id: cart_item.item_id)
          cart_item.destroy
        end

        # If the payment failed
        rescue Stripe::CardError => e
          flash[:error] = e.message
          redirect_to new_charge_path
        end
  end

  def update
  end

  def destroy
  end

end
