function data=get_channels(obj,chN)
    
    for i=1:length(chN)
        
        data.(['ch',obj.format_input(chN(i))])=obj.getChannel(chN(i));
        
    end
    
    data.chN=string(arrayfun(@(x) ['ch',obj.format_input(chN(x))],1:length(chN),'UniformOutput',false));
    
    obj.data=data;
    
end