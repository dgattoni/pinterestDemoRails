class Pin < ActiveRecord::Base
	validates :photo, presence: { message: "es requerido!"}
	validates :name, presence: { message: "es requerido!"}
    validates :description, presence: { message: "es requerido!"}

    # un pin le pertenece a 1 usuario.
    belongs_to :user

end
