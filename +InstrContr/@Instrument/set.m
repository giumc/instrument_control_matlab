function set(obj,comm,varargin)
           
    if ~isempty(varargin)
    
        value=varargin{1};
        
        if isstring(value)
            
            value=char(value);
            
        end
        
        if ~(ischar(varargin{1}))

            value=char(varargin{1});

        end

        fwrite(obj.interfObj,[comm,' ',value]);
        
        ret=obj.get(comm);
        
        msgerr=strcat(...
            sprintf('you requested to set %s as %s,\n', comm,value),...
            sprintf('the instrument returned %s',ret));
            
        if isfloat(str2double(value))

            if abs((ret-str2double(value))/ret)>0.01

                error(msgerr);

            end

        else
            
            if ischar(value)
                
                if ~strcmpi(sprintf([value,'\n']),obj.get(comm))
                    
                    error(msgerr);
                    
                end
                
            end
            
        end

    else

        fwrite(obj.interfObj,comm);

    end

end