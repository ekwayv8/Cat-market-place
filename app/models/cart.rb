class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items
	has_many :items, through: :cart_items

	def total_price
	    sum = 0.00
	    cart_items.each do |cart_item|
	    	#In order to have the price in decimal i use to_d
	      sum += cart_item.item.price.to_d * cart_item.quantity
	    end
	    return sum
  	end

	def count_items
	    number_of_items = 0
	    cart_items.each do |cart_item|
	      number_of_items += cart_item.quantity
	    end
	    return number_of_items
	end
end
