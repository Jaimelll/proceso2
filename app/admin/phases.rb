ActiveAdmin.register Phase do

  
 
  permit_params :nomenclatura, :proceso,:descripcion, :moneda,:referencial,
                :estimado, :periodo, :periodo, :convocatoria, :sele,
                :sele2,:sele3, :sele4, :sele5, :sele6, :sele7,
                :obs, :admin_user_id
  

            




  menu priority: 17, label: "Buscador Procesos"
  
  
  
 
  
  
  
  filter :proceso
  
  filter :descripcion
  
  
  
  
  
  index :title => proc {"BUSCADOR PROCESOS  "}   do
  
  
    column("proceso", :sortable => :proceso) 
    
    column("expediente") 
    column("Convoca", :sortable => :convo) 
    
    column("descripcion") do |phase|
      phase.descripcion.upcase  
    end
   
   
    column("Estimado(soles)", :class => 'text-right', sortable: :estimado)  do |phase|
      if phase.estimado then
         number_with_delimiter(phase.estimado, delimiter: ",")
      else
        "s/d"
      end
    end  
  
   
    actions
  end
  
  form :title => 'Edicion Procesos' do |f|
  
      f.inputs  do
  
        f.input :nomenclatura , :input_html => { :style =>  'width:30%'}
        f.input :proceso , :input_html => { :style =>  'width:30%'}
        f.input :convocatoria , :input_html => { :style =>  'width:30%'}
        f.input :descripcion ,:label => 'Descripcion del bien o servicio'
        f.input :moneda  
        f.input :referencial,:label => 'Valor Referencial', :as => :string, :input_html => { :style =>  'width:30%'}
        f.input :estimado,:label => 'Valor Estimado', :as => :string, :input_html => { :style =>  'width:30%'}
        
        f.input :periodo
        f.input :admin_user_id, :input_html => { :value => current_admin_user.id }, :as => :hidden
        f.input :obs   
          
          f.actions   
  
  
  
      end #de inputs
  end #de form
  
  show :title => ' Proceso'  do
  
      attributes_table  do
  
  
  
        row :nomenclatura
        row :proceso
        row :convocatoria
        row :descripcion
        row :moneda 
        row :referencia
        row :estimado
        row :periodo 
        row "Modificado por" do |phase|
          AdminUser.find_by_id(phase.admin_user_id).email        
        end 
        row :obs
  
    end #de attributes_table
  
  end # de show
  
  
  
   
  
  
  end
  
  