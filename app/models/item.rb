class Item < ApplicationRecord

	#Title validation: it is mendatory to have a title for an item and also that title need to contain between 5 and 140 characters
    validates :title,
    presence: true,
    length: { in: 4..140 }

    #Description validation: it is mendatory to have a description for an item and also that description need to contain between 10 and 1000 characters
    validates :description,
    presence: true,
    length: { in: 10..1000 }

    #Price validation: it is mendatory to have a price for an item and also that price need to be decimal
    validates :price,presence: true
	
	#Image_url validation: it is mendatory to have an image_url for an item
	validates :image_url, presence: true

	#Link to join table that we need to create (cart_items and item_orders) and also a link to the user table
	belongs_to :user
	has_many :cart_items
	has_many :carts, through: :cart_items   

    has_many :item_orders
	has_many :orders, through: :item_orders

end
