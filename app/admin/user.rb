ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  
  #LISTA DE PARAMETROS EN LISTA BLANCA
  permit_params :email
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  #muestro por pantalla solo las columnas que me interesan del usuario Logueado.
  index do
      column :id
      column :email  
      column :sign_in_count
      column :created_at
      #las acciones view/edit/delete se muestran en actions
      actions
  end

  #genera un .csv con sola columna que es email..
  csv do
    column :email
  end
 



end
