# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'activerecord-reset-pk-sequence'

#User.destroy_all
Item.destroy_all
#Order.destroy_all
#Cart.destroy_all
#CartItem.destroy_all
#ItemOrder.destroy_all

#Allow us to reset id for every objet that we destroy! So when we run db:seed again we restart with id 1 (not with id 234 for example)
#User.reset_pk_sequence
Item.reset_pk_sequence
#Order.reset_pk_sequence
#Cart.reset_pk_sequence
#CartItem.reset_pk_sequence
#ItemOrder.reset_pk_sequence

#5.times do
#	first_name = Faker::Name.first_name 
#	last_name = Faker::Name.last_name
#	email = "#{first_name}.#{last_name}@yopmail.com"
#	user = User.create!(email: email,password: 'mobinawa', encrypted_password: Faker::Internet.password)
#end

20.times do
	item = Item.create!(title: Faker::Creature::Cat.name,description:Faker::Hipster.paragraph,price: Faker::Number.decimal(l_digits: 2), image_url: "cat-product/cat-item-image_url.jpg")
end

#10.times do
#	order = Order.create
#end

#We have one problem : We don't have one cart for an unique user! let try to find how to correct that
#5.times do
#   cart = Cart.create(user_id: User.all.ids.sample)
#end

#5.times do
#   cart_item = CartItem.create(item_id: Item.all.ids.sample, cart_id: Cart.all.ids.sample)
#end

#5.times do
#   item_order = ItemOrder.create(order_id: Order.all.ids.sample, item_id: Item.all.ids.sample)
#end
