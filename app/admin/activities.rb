ActiveAdmin.register Activity do

 
menu false



permit_params :actividad, :tipo,:numero, :pfecha,:importe,
              :plan,:moneda,:importe,:obs,
              :admin_user_id, :phase_id

        


 belongs_to :phase  
#este belong es para no duplicar rutas y para que funcione todo

filter :pfecha

index :title => "Lista de Actividades Procesos"  do

column("Actividad", :sortable => :phase_id) do |activity|
  activity.actividad
end
column("Fecha ", :sortable => :pfecha) do |activity|
  if activity.pfecha then
    activity.pfecha.strftime("%d-%m-%Y")
  else
    "s/d"
  end
end


column("Documento de recepcion") do |detail|
  detail.tipo
end

column("Numero de documento") do |detail|
     detail.numero
   
  end

column("obs")


actions


end #de index

form :title => 'Edicion Actividad'  do |f|


      f.inputs  do


             f.input :actividad
             f.input :tipo,:label => 'Documento de recepcion', :input_html => { :style =>  'width:30%'}
             f.input :numero,:label => 'Numero de documento', :input_html => { :style =>  'width:30%'}
             f.input :pfecha, :label => 'fecha' , as: :datepicker, :input_html => { :style =>  'width:30%'}
             f.input :importe,:label => 'Importe ',:as =>:string, :input_html => { :style =>  'width:30%'}
             f.input :moneda
             f.input :obs,:as =>:string
             f.input :admin_user_id, :input_html => { :value => current_admin_user.id }, :as => :hidden


                   end
                
            f.actions



      

      end #de form

      show :title => ' ACTIVIDAD ' do


                attributes_table do

                nn=Phase.where(id:params[:phase_id]).
                         select('nomenclatura as dd').first.dd.capitalize


                  row "Ir Lista Actividades Procesos" do |activity|
                    link_to "#{nn}", admin_phase_activities_path(activity.phase_id)
                  end

                  row :actividad 
                  row "Documento de recepcion" do |activity|
                      activity.tipo
                    end
                  row "Numero de documento" do |activity|
                      activity.numero
                    end


                  row "fecha  " do |activity|

                     activity.pfecha.strftime("%d-%m-%Y")
                   end



                  row :importe do |activity|

                     number_with_delimiter(activity.importe, delimiter: ",")

                    end



                  row :moneda 

                  row :obs
                
                  row "Modificado por" do |phase|
                    AdminUser.find_by_id(phase.admin_user_id).email
                  end

                end

            end








end #de register

