function outcome=calc_data(obj,fields_in,fun,field_out)

    if isempty(obj.outcome)
        
        result=obj.outcome;
        
        return
        
    end
    
    if ~isa(fun,'function_handle')
        
        error('pass a function here');
        
    end
    
    if isa(fields_in,'char')
        
        fields_in=string(fields_in);
        
    end
    
    outcome=obj.outcome;
    
    if ~(all(arrayfun(@(x) any(contains(...
                string(fieldnames(outcome(1,1).data)),x)),...
            fields_in)))
        
        error('%s contains unvalid fields',fields_in);
        
    end
    
    outcome=obj.data_function_sweep(outcome,@(x) op(x));
    
    obj.outcome=outcome;
    
    function x=op(x)
        
        arr=zeros(1,length(fields_in));
        
        for i=1:length(fields_in)
            
            arr(i)=x.(fields_in(i));

        end
        
        x.(field_out)=fun(arr);
        
    end
    
end