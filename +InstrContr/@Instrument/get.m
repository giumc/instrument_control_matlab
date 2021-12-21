function y=get(obj,command,varargin)
            
    if ~(command(end)=='?')

        command=[command,'?'];

    end
    
    fprintf(obj.interfObj,[command,varargin{:}]);

    pause(0.5);

    y=fscanf(obj.interfObj);

    if isempty(y)
        
        error("command %s had no return",command);
        
    end
        
    if ~isnan(str2double(y))
        
        y=str2double(y);
        
    else
        
        if double(y(end))==10
            
            y(end)=[];
            
        end
        
    end
       
end
