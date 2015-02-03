ActiveAdmin.register Pin do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #paramatros en lista BLANCA
  permit_params :photo, :description, :name, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  #muestro las columnas que me interesan mostrar en el index de Pins de Active Admin
  index do
    column :id
    column :photo
    column :description
    column :name
    actions
  end

  #genera un .csv con 2 columnas que es name y description
  csv do
    column :name
    column :description
  end

#muestro el filtro cde usuarios como Combobox  y cargo todos los Users.
filter :user_id, as: :select, collection: proc {(User.all).map {|c| [c.email, c.id]}}

#redibujo el Formulario de "New Pin" del Active Admin.!!
form do |f|
  inputs "Datos del Pin" do
   input :user_id, as: :select, collection: User.all.map{|u| [u.email, u.id]}
   input :name
   input :description
   input :photo
   f.actions
 end 


end





end
