function set(obj,comm,varargin)
           
    if ~isempty(varargin)
    
        value=varargin{1};
        
        if isstring(value)
            
            value=char(value);
            
        end
        
        if ~(ischar(varargin{1}))

            value=num2str(varargin{1});

        end

        fwrite(obj.interfObj,[comm,' ',value]);
        
        ret=obj.get(comm);
            
        if isfloat(str2double(value))
            
            msgerr=strcat(...
                sprintf('you requested to set %s as %.2e,\n',comm,str2double(value)),...
                sprintf('the instrument returned %.2e',str2double(ret)));

            if abs((str2double(ret)-str2double(value))/str2double(ret))>0.01

                error(msgerr);

            end

        else
            
            if ischar(value)
                
                if ~strcmpi(sprintf([value,'\n']),ret)
                    
                    msgerr=strcat(...
                        sprintf('you requested to set %s as %s,\n',comm,value),...
                        sprintf('the instrument returned %s',ret));
                    
                    error(msgerr);
                    
                end
                
            end
            
        end

    else

        fwrite(obj.interfObj,comm);

    end

end