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
        
        comm=string([comm,' ',val_pass]);
    
    else
        
        comm=string(comm);
        
    end

    obj.interfObj.writeline(comm);

%     try
%         
%         obj.check_for_errors;
%        
%     catch exception
%         
%         error("writing ""%s"" caused error :\n%s",comm,exception.message);
% 
%     end
        
end