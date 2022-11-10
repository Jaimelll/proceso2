
ActiveAdmin.register_page "grafico" do

  menu  priority: 10,label: "Grafico"

  



  content title: "Grafico" do

    
     #datos de grafico var y titulo, vaf de año fiscal
     @var=Formula.where(product_id:1,numero:1).
                          select('orden as dd').first.dd
     @titulo=Formula.where(product_id:1,numero:1).
                          select('nombre as dd').first.dd
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
    @adec=[]
    @aeobac=[]
    @avefc=[]
    @avdesi=[]
    @avenvdes=[]
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
        @vdec=@vproceso[6]
        @veobac=@vproceso[7]
        @vefc=@vproceso[8]
        @vdesi=@vproceso[9]
        @venvdes=@vproceso[10]
        @vcan=@vproceso[11]












    #@alabels.push(item.pac+"--------"+number_with_delimiter(item.certificado, delimiter: ",").to_s+"----"+@n1)
    #@alabels2.push(item.descripcion.first(10))
    @desc=item.descripcion.underscore

    if @desc[0,3]=='adq' then
        @desc=@desc[14,54]
    else
     @desc=@desc

    end


    #@alabels.push(item.pac+"--------"+number_with_delimiter(item.certificado, delimiter: ",").to_s+"----"+@n1)
    @lab1=@desc.capitalize.truncate(70)+"-"+item.proceso






       @alabels.push(@lab1)
       @aversion.push(@vversion)
       @aobac.push(@vobac)
       @apec.push(@vpec)
       @adac.push(@vdac)
       @adem.push(@vdem)
       @adpc.push(@vdpc)
       @adec.push(@vdec)
       @aeobac.push(@veobac)
       @avefc.push(@vefc)
       @avdesi.push(@vdesi)
       @avenvdes.push(@venvdes)
       @avcan.push(@vcan)




    end #terminia  item
    #termina item***********************************************

    if @vtitun then
    @vtit=@titulo+'-'+@vtitun
    else
    @vtit=@titulo
    end


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
                            :param8 => @adec,
                            :param9 => @aeobac,
                            :param10 => @avefc,
                            :param11 => @avdesi,
                            :param12 => @avenvdes,   
                            :param13 => @avcan,                                                                                
                            :param20 =>  @vtit}


           end
     end
  end
end