ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :categoria, :periodo

  menu  priority: 60, label: "Usuarios"

  #actions :all
  
    index  do
      
      column :id
      column :email
      column :current_sign_in_at
      column :sign_in_count
      column :created_at
      column :categoria
      column :periodo
  
      actions
  
   
  end
  
    filter :email
    filter :categoria
  
    form do |f|
      f.inputs "Admin Details" do
        f.input :email
        f.input :password
        f.input :password_confirmation
          
        f.input :categoria
        f.input :periodo
       
        f.actions
    end
  
  end
  
  show :title => ' Usuario'  do
  
      attributes_table  do
  
  
  
  
  
        row :email
        row :password
        row :password_confirmation       
        
        row :categoria
        row :periodo
       
  
    end #de attributes_table
  
  end # de show
 end
