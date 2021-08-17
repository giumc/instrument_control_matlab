function result=calcAverage(obj)
          
    if isempty(obj.outcome)
        
        result=obj.outcome;
        
        return
        
    end
    
    result=obj.channel_function_sweep(obj.outcome,@(x) chdata_op(x));

    function data=chdata_op(data)
        
        data.average_v=sum(data.v)/length(data.v);
        
    end

    obj.outcome=result;

end