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
   
    end

    fprintf(obj.interfObj,comm);
% 
%     try
%         
%         obj.check_for_errors;
%        
%     catch exception
%         
%         fprintf("writing ""%s"" caused error :\n",comm);
%         
%         rethrow(exception)
% 
%     end
        
end