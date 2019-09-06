class UserMailer < ApplicationMailer
	
default from: 'no-reply@cat-marketplace-prod.herokuapp.com'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://cat-marketplace-prod.herokuapp.com/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Cat Lovers! Bienvenue dans le futur! Enjoy') 
  end

    def new_order_email(order)
	    @user = order.user 
	    mail(to: @user.email, subject: "Super! Tu viens de commander la plus belle photo de chat du monde!ENJOY !") 
	end

	def new_order_email_admin(order)
	    @user = order.user 
	    @admin = User.where(is_admin: "true")

	    @admin.each do |admin|
	    mail(to: admin.email, subject: "WakeUp! Tu viens de recevoir une commande sur la boutique du futur !")
		end
	end

end
