function outcome=calcChPower(obj,r)

    outcome=obj.outcome;
    
    outcome=obj.channel_function_sweep(outcome,@(x) fun(x,r));
    
    obj.outcome=outcome;
    
    function x=fun(x,r)
        
        x.chPower=(x.average_v).^2/r;
        
    end
    
end