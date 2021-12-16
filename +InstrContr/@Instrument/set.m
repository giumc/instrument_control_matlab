function set(obj,comm,varargin)
           
    if ~isempty(varargin)
    
        value=varargin{1};
        
        switch class(value)
            
            case 'string'
                
                val_pass=char(value);

            case {'double'}
                
                val_pass=num2str(value);
                
            case 'char'
                
                val_pass=value;
                
        end
        
        comm=[comm,' ',val_pass];
           
        fprintf(obj.interfObj,comm);
        
    else

        fprintf(obj.interfObj,comm);

    end
    
    error_bin=dec2bin(obj.get('*ESR'));
        
    if ~strcmp(error_bin,'0')
        % TO DO : specialize error return
        error("writing %s caused error %s in ESR",comm,error_bin);

    end
        
end