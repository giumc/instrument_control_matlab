function set_channel_param(obj,i,varargin)
    
    if any(i==[1,2])
        
        obj.set('c',i);
        
    else
        
        error(" There are only 2 channels (you passed %d)",i);
        
    end
    
    obj.set(varargin{:});
        
end