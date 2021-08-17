function outcome=calcAverageDifference(obj)

    if isempty(obj.outcome)
        
        result=obj.outcome;
        
        return
        
    end
     
    outcome=obj.outcome;
   
    tags=fieldnames(outcome(1,1).data);
    
    outcome=obj.data_function_sweep(obj.outcome,@(x) diffFun(x));
    
    obj.outcome=outcome;

    function x=diffFun(x)
        
        averages=[];
        
        for i=1:length(tags)
            
            averages=[averages,x.(tags{i}).average_v];
                
        end
        
        x.average_diff=diff(averages);
    
    end

end
