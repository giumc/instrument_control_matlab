function output=run_SE_experiment(obj,freq,power,ch,res,varargin)

    obj.collect_data(freq,power,ch,varargin{:});
    
    output=obj.outcome;
    
    function outcome=calc_vals(outcome)
        
        data=outcome.data;
        
        rect_power=0;
        
        chN=data.chN;
        
        for i=1:length(chN)
            
            data.(chN(i)).average_v=sum(data.(chN(i)).v)/length(data.(chN(i)).v);
            
            data.(chN(i)).dc_power=data.(chN(i)).average_v^2/res;
            
            rect_power=rect_power+data.(chN(i)).dc_power;
            
        end
        
        outcome.data=data;
        
        outcome.rect_power=rect_power;
        
        outcome.efficiency=rect_power/obj.dbm2w(outcome.power);
        
        outcome.resistor=res;
        
    end

    output=obj.apply_to_output(@(x) calc_vals(x));
        
    obj.outcome=output;
    
end