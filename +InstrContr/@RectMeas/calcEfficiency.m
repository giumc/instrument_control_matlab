function calcEfficiency(obj)

    outcome=obj.outcome;
    
    obj.outcome=obj.function_sweep(outcome,@(x) op(x));
    
    function x=op(x)
        
        x.efficiency=x.data.totPower/(1e-3*10^(x.power/10));
        
    end

end