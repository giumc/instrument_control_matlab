function y=get(obj,command,varargin)
            
    if ~(command(end)=='?')

        command=[command,'?'];

    end

    try
        
        y=obj.interfObj.writeread([command,varargin{:}]);

    catch exception
        
        error("query of ""%s"" has returned error :\n%s",command,exception.message);
        
    end
    
    if ~isnan(str2double(y))
        
        y=str2double(y);
        
    end
       
end
