class Order < ApplicationRecord
	after_create :new_order_send

	belongs_to :user
	has_many :item_orders
	has_many :items, through: :item_orders

	def new_order_send
		UserMailer.new_order_email(self).deliver_now
		UserMailer.new_order_email_admin(self).deliver_now
	end
	
	def total_price
	    total = 0.00
	    item_orders.each do |item_order|
	      total += item_order.item.price.to_d * item_order.quantity
	    end
	    return total
  	end


end
