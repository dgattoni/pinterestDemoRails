class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	#Paso 4: Hacemos nuestro modelo User compatible con omniauth.
  devise :omniauthable, omniauth_providers: [:facebook]

#Paso 6: Método para buscar los usuarios
 def self.find_for_facebook_oauth(auth, signed_in_resource=nil)      
	  user = User.where(provider: auth.provider, uid: auth.uid).first       
	  # The User was found in our database    
	  return user if user    
	  # Check if the User is already registered without Facebook      
	  user = User.where(email: auth.info.email).first 
	  # Creamos un usuario nuevo en la BD con los datos que puedo acceder de su cuenta de fbook.
	  #la gracia esta en capturar su imagen y mostrarla en la vista pages/index 
	  #la imagen se mostrara SOLO si user_signed_in? es true.
	  return user if user
	  User.create(
	    name: auth.extra.raw_info.name,
	    provider: auth.provider, uid: auth.uid,
	    email: auth.info.email,
	    password: Devise.friendly_token[0,20],
	    image: auth.info.image)  
 end




	#un user tiene muchos pins.
	 has_many :pins
 
end
