function output=run_diff_experiment(obj,freq,power,ch,res,varargin)

    obj.collect_data(freq,power,ch,varargin{:});
    
    input=obj.outcome;
    
    for i=1:numel(input)
        
        o=input(i);

        chN=o.data.chN;
        
        for j=1:length(chN) % calculate average
            
            ch=o.data.(chN(j));
            
            o.data.(chN(j)).average_v=sum(ch.v)/length(ch.v);
            
        end
        
        rect_v=0;
        
        for j=1:length(chN)
            
            rect_v=rect_v-o.data.(chN(j)).average_v;
            
        end
                  
        o.rect_power=rect_v^2/res;
        
        o.efficiency=o.rect_power/obj.dbm2w(o.power);
        
        o.resistor=res;
        
        output(i)=o;
        
    end
    
    obj.outcome=output;
    
end