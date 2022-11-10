
ActiveAdmin.register_page "grafico" do

  menu  priority: 10,label: "Grafico"

  



  content title: "Grafico" do

    
     #datos de grafico var y titulo, vaf de año fiscal
     @var=Formula.where(product_id:1,numero:1).
                          select('orden as dd').first.dd
     
      @vaf=current_admin_user.periodo




     

      
         @vitem=Phase.where(periodo:@vaf)
         @iproce=100

    @adata=[]
    @alabels=[]
    @blabels=[]




    @aversion=[]
    @aobac=[]
    @apec=[]
    @adac=[]
    @adem=[]
    @adpc=[]
    
    @avcan=[]



    @vproceso=[]
  #  @vproceso1=[]
    
################
    
    phafuncion = PhasesController.new 
    @vinicio,@vfin,@dfin,@vrang,@vtitun= phafuncion.per_anual(@vaf)

###############

    @vitem.each do |item|

      #prueba conta

      #empieza el item



    @vproceso=[]
    
    
    @vproceso,@vproceso1=phafuncion.diasproce(item.id,@vinicio,@vfin)
   



    @vversion=@vproceso[0]
       @vobac=@vproceso[1]
        @vpec=@vproceso[2]
        @vdac=@vproceso[3]
        @vdem=@vproceso[4]
        @vdpc=@vproceso[5]
        
        @vcan=@vproceso[11]












    #@alabels.push(item.pac+"--------"+number_with_delimiter(item.certificado, delimiter: ",").to_s+"----"+@n1)
    #@alabels2.push(item.descripcion.first(10))
    @desc=item.descripcion.underscore
    vuobs=phafuncion.uobs(item.id,@vfin)


    #@alabels.push(item.pac+"--------"+number_with_delimiter(item.certificado, delimiter: ",").to_s+"----"+@n1)
   # @lab1=@desc.capitalize.truncate(70)+"-"+item.proceso
   @lab1=@desc.upcase+" - "+item.proceso+" ("+vuobs+" )"

   



       @alabels.push(@lab1)
       @aversion.push(@vversion)
       @aobac.push(@vobac)
       @apec.push(@vpec)
       @adac.push(@vdac)
       @adem.push(@vdem)
       @adpc.push(@vdpc)
      
       @avcan.push(@vcan)




    end #terminia  item
    #termina item***********************************************

    


    columns do
           column do


#@alabels=@alabels.map { |i| " '" + i + "'" }.join(',')
#@alabels=@alabels.join(",")

               render :partial => "grafico",
               :locals => { :param1 => @alabels,
                            :param2 => @aversion,
                            :param3 => @aobac,
                            :param4 => @apec,
                            :param5 => @adac,
                            :param6 => @adem,
                            :param7 => @adpc,

                               
                            
                            :param13 => @avcan,                                                                                
                            :param20 =>  @vtitun}


           end
     end
  end
end