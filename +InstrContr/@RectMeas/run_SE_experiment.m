function output=run_SE_experiment(obj,freq,power,ch,res,varargin)

    obj.collect_data(freq,power,ch,varargin{:});
    
    input=obj.outcome;
    
    for i=1:numel(input)
        
        o=input(i);

        chN=o.data.chN;
        
        for j=1:length(chN) % calculate average
            
            ch=o.data.(chN(j));
            
            average_v=sum(ch.v)/length(ch.v);
            
            dc_power=average_v^2/res;
            
            o.data.(chN(j)).average_v=average_v;
            
            o.data.(chN(j)).dc_power=dc_power;
            
        end
        
        rect_power=0;
        
        for j=1:length(chN)
            
            rect_power=rect_power+o.data.(chN(j)).dc_power;
            
            efficiency=rect_power/obj.dbm2w(o.power);
            
        end
        
        o.rect_power=rect_power;
        
        o.efficiency=efficiency;
        
        output(i)=o;
        
        o.resistor=res;
        
    end
    
    obj.outcome=output;
    
end