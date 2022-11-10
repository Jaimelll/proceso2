class PhasesController < InheritedResources::Base


    def form_nomb(vprod,vord)
  
        if Formula.where(product_id:vprod,orden:vord).count>0 then
            vnom=Formula.where(product_id:vprod,orden:vord).
                select('nombre as dd').first.dd
        else
          vnom=" "
        end
      
        return vnom
       end
      #fin de nombre formula

      def form_desc(vprod,vord)
  
        if Formula.where(product_id:vprod,orden:vord).count>0 then
            vnom=Formula.where(product_id:vprod,orden:vord).
                select('descripcion as dd').first.dd
        else
          vnom=" "
        end
      
        return vnom
       end
      #fin de nombre formula
      

      

      
    def per_anual(var)
        vcini=(2021+var).to_s+'/01/01'
        vcfin=(2021+var).to_s+'/12/31'
        @vinicio = Date.parse(vcini)
        @dfin=365
        @vfin=Date.parse(vcfin)
        @vrang=30
        @vtitun='AF-'+(2021+var).to_s
    
        if Time.now<=@vfin then
          @dfin=(Time.now-@vinicio.to_time).to_i/86400
          @vfin=Time.now
           @vrang=15
        end  
        
       return  @vinicio, @vfin,@dfin,@vrang,@vtitun
     
      
    end  

    def diasproce(vid,vinicio,vfin)

        @vproceso=[0,0,0,0,0,0,0,0,0,0,0,0]
        @vproceso2=[0,0,0,0,0,0,0,0,0,0,0,0]
    
        @vproceso1=[]
    
      
        @vproceso1[0]=vinicio.to_date

            
            Formula.where( product_id:3).where.not(cantidad:0).order('orden').each do |vpro1|
              vfecaho=paradiap(vid,vpro1.orden,vinicio)
              if  vfecaho>vinicio.to_date    then
                @vproceso2[vpro1.orden]=1
              end
              if vfecaho<vfin.to_date and  vfecaho>=vinicio.to_date    then
                @vproceso1[vpro1.orden]=vfecaho
              end
              if vfecaho>=vfin.to_date 
                @vproceso1[vpro1.orden]=vfin.to_date
              end  
              if vfecaho<vinicio.to_date 
                @vproceso1[vpro1.orden]=vinicio.to_date
              end  
              if vpro1.orden>0
                  if @vproceso1[vpro1.orden]<@vproceso1[vpro1.orden-1]
                    @vproceso1[vpro1.orden]=@vproceso1[vpro1.orden-1]
                  end
              end 
              if vpro1.orden>1 and  @vproceso1[vpro1.orden-1]==vinicio.to_date
                @vproceso1[vpro1.orden-1]=@vproceso1[vpro1.orden]
              end
            # Formula.where(product_id:40,orden:vpro1.orden).update_all(descripcion:@vproceso1[vpro1.orden])
            #  Formula.where(product_id:40,orden:13).update_all(descripcion:item.id)
              
            end 
    
    
          @conta=0
          while @conta<11
    
            @vproceso[@conta] =plazodias(@vproceso1[@conta],@vproceso1[@conta+1])
          #  Formula.where(product_id:40,orden:@conta).update_all(cantidad:@vproceso[@conta])
            @conta=@conta+1 
          end  
    
    
          vnsel=0
          Formula.where( product_id:3).order('orden DESC').each do |vpro2|
            if vnsel==0 and @vproceso1[vpro2.orden]<vfin.to_date and @vproceso2[vpro2.orden]==1   then
            Phase.where(id:vid).update_all(sele6:vpro2.orden,sele4:vpro2.orden-1)
            # dd1 cambiado por sele4
            vnsel=1
            end 
          end
    
    
       return @vproceso,@vproceso1
    
       end #fin de diasproce
    

       def paradiap(idphase,vactiv,vinicio)
        # idphase  id_phase, vord actividad,vactiv actividad
    
        
            vddia=vinicio.to_date
            
              
            
            if Activity.where(phase_id:idphase,actividad:vactiv).count>0   then
            
            
                    vddia =Activity.where(phase_id:idphase,actividad:vactiv).order('pfecha DESC').
                    select('pfecha as dd').first.dd
                    
            
            end 
           return vddia   
       end

       def plazodias(var1,var2)
        # var1 fecha1, var2 fecha2, vfin fecha final
            vddia2=var2
            vferi=Formula.where(product_id:4,cantidad:1).select("TO_DATE(nombre, 'DD/MM/YYYY')").map {|e| e.
             attributes.values}.flatten.compact
              nnddias=0
           if var1!=" " and var2!=" " then
              while  var1<vddia2 
               
                   vddia2=vddia2-1
                  unless vddia2.wday==0 or  vddia2.wday==6  or vferi.include?(vddia2)
     
                  
                      
                      nnddias=nnddias+1
     
     
     
     
                    end   # unless                     
        
               end #de while
             end
        
                   
                       
                 return nnddias
        end
     
      
    
    
end