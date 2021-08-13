function result=extractAverage(obj)
    
    outcome=obj.outcome;
    
    if isempty(outcome)
        
        error("No data present in RectMeas!");
        
    end
    
    dims=size(outcome);
    
    for i=1:numel(outcome)
       
        data=outcome(i).channel_data;
            
        index=ind2sub(dims,i);
        
        result(index).freq=outcome.freq(i);
        
        result(index).power=outcome.power(i);
        
        for j=1:length(data)
            
            average(j)=sum(data(j).v)/length(data(j).v);
            
        end
        
        result(index).channel_data=average;
        
    end
    
    obj.averaged_outcome=result;
       
end