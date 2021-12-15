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
           
        fprintf(obj.interfObj,[comm,' ',val_pass]);
        
        if comm(end)==':'
            
            ret=obj.get(comm(1:end-1));
            
        else
            
            ret=obj.get(comm);
            
        end
            
        if isnumeric(ret)
            
            switch class(value)
                
                case {'double'}
                    
                    val_cmp=value;
                    
                case {'string','char'}
                    
                    if isnan(str2double(value))
                        
                        error(msg_err(comm,num2str(ret),value));
    
                    else
                        
                        val_cmp=str2double(value);
                        
                    end
                    
            end
               
            if ret==0
                
                if ~(val_cmp==0)
                    
                    error(msg_err(comm,num2str(ret),num2str(val_cmp)));
                    
                end
                
            else

                if abs(ret-val_cmp)/ret>0.01

                    error(msg_err(comm,num2str(ret),num2str(val_cmp)));

                end

            end
            
        else
            
            switch class(value)
                
                case {'double'}
                    
                    error(msg_err(comm,ret,num2str(value)));
                
                case {'char','string'}
                    
                    if ~strcmpi(sprintf([value,'\n']),ret)                    

                        error(msg_err(comm,ret,value));

                    end
                
            end
            
        end

    else

        fprintf(obj.interfObj,comm);
        
    end

    function y=msg_err(cmd,r,x)

    y=strcat(...
        sprintf('cross-check query of %s returned %s',...
            cmd,r),...
        sprintf('while you passed %s',x));

    end
        
end