function outcome=calcTotPower(obj)

    outcome=obj.outcome;
    
    obj.outcome=obj.data_function_sweep(outcome,@(x) op(x));
    
    function x=op(x)
        
        chN=x.chN;
        
        pow=0;
        
        for i=1:length(chN)
            
            pow=pow+x.(chN(i)).chPower;
            
        end
        
        x.totPower=pow;
        
    end
    
end