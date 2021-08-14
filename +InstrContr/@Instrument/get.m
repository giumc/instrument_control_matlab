function y=get(obj,command,varargin)
            
    if ~(command(end)=='?')

        command=[command,'?'];

    end

    y=query(obj.interfObj,command,varargin{:});

end
