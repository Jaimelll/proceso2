ActiveAdmin.register Product do

  permit_params :nombre, :descripcion, :orden,
  :obs, :admin_user_id, :created_at, :updated_at

menu  priority: 40, label: "Productos"



  action_item :view, only: :show do
    link_to 'Ir a Productos', admin_products_path()
  end

filter :nombre
filter :orden



index do
column("nombre") do |producto|
  link_to "#{producto.nombre} ", admin_product_formulas_path(producto) 
 end
column("descripcion")
column("orden")


 actions
end



form do |f|

f.inputs "Products" do
     f.input :nombre
     f.input :descripcion
     f.input :orden
     f.input :admin_user_id, :input_html => { :value => current_admin_user.id }, :as => :hidden
end



  f.actions

end


show do


       attributes_table do



         row :nombre
         row :descripcion
         row :orden
         row "Modificado por" do |phase|
          AdminUser.find_by_id(phase.admin_user_id).email        
        end 
       end

   end




end


