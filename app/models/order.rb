class Order < ApplicationRecord
	belongs_to :user, optional: true
	has_many :item_orders
	has_many :items, through: :item_orders

end
