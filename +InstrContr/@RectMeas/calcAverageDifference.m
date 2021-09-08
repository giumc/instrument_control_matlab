function outcome=calcAverageDifference(obj)

    outcome=obj.outcome;
        
    if isempty(obj.outcome)
        
        return
        
    end
    
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
