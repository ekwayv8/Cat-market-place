class CartsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def show
     @cart = current_user.cart
  end

  def create
  end

  def update
  end

  def destroy
  end
end
