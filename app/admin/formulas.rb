ActiveAdmin.register Formula do

  menu false
permit_params  :nombre, :descripcion,  :orden,
   :cantidad, :admin_user_id, :product_id,
     :numero, :acti, :respon, :respon2, :obs

     belongs_to :product
  #este belong es para no duplicar rutas y para que funcione todo

      action_item :view, only: :show do
        link_to 'Ir a Productos', admin_products_path()
      end

      action_item :view, only: :show do
        link_to 'Nueva formula', admin_products_path()
      end
      
      



filter :nombre
filter :descripcion
filter :cantidad
filter :numero
filter :orden
filter :acti
filter :respon


      index do
        column("nombre")do |formula|
          link_to "#{formula.nombre}", admin_products_path()
        end
        column("descripcion")
        column("orden")
        column("cantidad")
        column("numero")
        column("acti")
        column("respon")
          actions
      end








          form do |f|

           
               nn=Product.where(id:params[:product_id]).
                        select('nombre as dd').first.dd.capitalize
              f.inputs "#{nn}" do
              f.input :product_id, :label => 'Producto' ,
                       :input_html => { :value => params[:product_id]}, :as => :hidden
              f.input :nombre, :input_html => { :style =>  'width:30%'}
              f.input :descripcion
              f.input :orden, :input_html => { :style =>  'width:30%'}
              f.input :cantidad, :input_html => { :style =>  'width:30%'}
              f.input :numero, :input_html => { :style =>  'width:30%'}
              f.input :acti, :input_html => { :style =>  'width:30%'}
              f.input :respon, :input_html => { :style =>  'width:30%'}   
              f.input :obs              
              f.input :admin_user_id, :input_html => { :value => current_admin_user.id }, :as => :hidden
              
            end
              f.actions
        end



show do


          attributes_table do

            nn=Product.where(id:params[:product_id]).
                     select('nombre as dd').first.dd.capitalize

            row :product_id do |formula|
              link_to "#{nn}", admin_product_formulas_path(formula.product_id)
            end
            row :nombre
            row :descripcion
            row :orden
            row :cantidad
            row :numero
            row :acti
            row :respon
            row :obs
            row "Modificado por" do |phase|
              if phase.admin_user_id then
              AdminUser.find_by_id(phase.admin_user_id).email
              end
            end
          end

      end






end

