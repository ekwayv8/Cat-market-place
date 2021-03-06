class Item < ApplicationRecord

	#Title validation: it is mendatory to have a title for an item and also that title need to contain between 5 and 140 characters
    validates :title,
    presence: true

    #Description validation: it is mendatory to have a description for an item and also that description need to contain between 10 and 1000 characters
    validates :description,
    presence: true

    #Price validation: it is mendatory to have a price for an item and also that price need to be decimal
    validates :price, numericality: { greater_than_or_equal_to: 0 }
	
	#Image_url validation: it is mendatory to have an image_url for an item
	validates :image_url, presence: true

	#Link to join table that we need to create (cart_items and item_orders) and also a link to the user table
	has_many :cart_items
	has_many :carts, through: :cart_items   

  has_many :item_orders
	has_many :orders, through: :item_orders

	#Link to ActiveStorage for the image_upload
	has_one_attached :image_upload

end
