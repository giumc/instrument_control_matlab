function y=get(obj,command,varargin)
            
    if ~(command(end)=='?')

        command=[command,'?'];

    end
    
    if ~isempty(varargin)
        
        command=strcat(command,varargin{:});
    
    end
    
    fprintf(obj.interfObj,command);

    pause(0.5);

    [y,~,msg]=fscanf(obj.interfObj);

    if isempty(y)
        
        error("command %s returned error %s",command,msg);
        
    end
        
    if ~isnan(str2double(y))
        
        y=str2double(y);
        
    else
        
        if double(y(end))==10
            
            y(end)=[];
            
        end
        
    end
       
end
