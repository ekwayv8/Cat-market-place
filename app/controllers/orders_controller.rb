class OrdersController < ApplicationController
  def new
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  def validate
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'kitty purchase',
    currency: 'usd',
  })

  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to create_order_path
  end


end
