function flag=save_data(obj,path,name)
    
    data=obj.outcome;

    full_name=strcat(path,filesep,datestr(datetime,'dd_mmm_yyyy_HH_MM_SS'));

    if ~exist(path)
        
        flag=mkdir(path);
        
        if ~flag
            
            error("Could not create %s",path);
        
        end
        
    else
    
        save(full_name,'data');
    
    end
    
    flag=true;
    
end