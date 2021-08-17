function y=get(obj,command,varargin)
            
    if ~(command(end)=='?')

        command=[command,'?'];

    end
    
    [y,~,msg]=query(obj.interfObj,command,varargin{:});
     
    if ~isempty(msg)
        
        error("query of ""%s"" has returned an error :\n %s",command,msg);
        
    end
    
    if ~isnan(str2double(y))
        
        y=str2double(y);
        
    end
       
end
