function data=calcChannel(data,fields_in,fun,field_out)
    
    if ~isa(fun,'function_handle')
        
        error('pass a function here');
        
    end
    
    if isa(fields_in,'char')
        
        fields_in=string(fields_in);
        
    end
    
    chNames=fieldnames(data);
    
    channel_sample=data_sample.(chNames{1});
    
    if ~any(contains(...
                fieldnames(channel_sample),...
                fields_in))
        
        error('%s contains unvalid fields',fields_in);
        
    else
        
        data.(field_out)=fun(data.(fields_in));
        
    end
    
end