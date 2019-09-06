class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Permet d'envoyer un email à l'utilisateur juste après la création de son compte
  after_create :welcome_send

  #Only one user can only have one cart
  has_one :cart
  
  #One user can place many orders
  has_many :orders

  after_create :create_cart

  def create_cart
    cart = Cart.new
    cart.user = self
    cart.save
  end
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
