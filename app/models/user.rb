class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	#Paso 4: Hacemos nuestro modelo User compatible con omniauth.
  devise :omniauthable, omniauth_providers: [:facebook]

	#un user tiene muchos pins.
	 has_many :pins
 
end
