function data=calc_channels(obj,fields_in,fun,field_out)
   
    data=obj.data;
    
    chNames=fieldnames(data);
    
    for i=1:length(chNames)
        
        data.(chNames{i})=obj.calcChannel(data.(chNames{i}),fields_in,fun,field_out);
        
    end
    
    obj.data=data;

end