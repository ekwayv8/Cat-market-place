# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'activerecord-reset-pk-sequence'

User.destroy_all
Item.destroy_all
Order.destroy_all
Cart.destroy_all
#Cart_item.destroy_all
#Item_order.destroy_all

#Allow us to reset id for every objet that we create 
User.reset_pk_sequence
Item.reset_pk_sequence
Order.reset_pk_sequence
Cart.reset_pk_sequence
#Cart_item.reset_pk_sequence
#Item_order.reset_pk_sequence

5.times do
	first_name = Faker::Name.first_name 
	last_name = Faker::Name.last_name
	email = "#{first_name}.#{last_name}@yopmail.com"
	user = User.create!(email: email,password: 'azerty', encrypted_password: Faker::Internet.password)
end

5.times do
	item = Item.create!(title: Faker::Book.title,description:Faker::Hipster.paragraph,price: Faker::Number.decimal(l_digits: 2), image_url: "https://unsplash.com/photos/7GX5aICb5i4")
end

10.times do
	order = Order.create
end

#We have one problem : We don't have one cart for an unique user! let try to find how to correct that
5.times do
   cart = Cart.create(user_id: User.all.ids.sample)
end

