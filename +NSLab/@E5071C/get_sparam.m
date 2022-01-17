function [f,s]=get_sparam(obj,x,y)

    comm=strcat(obj.sens_prefix,':data:corr?',32,...
        'S',num2str(x),num2str(y));
    
    fprintf(obj.interfObj,comm);
        
    raw_data=split(fscanf(obj.interfObj),',');
    
    s_param=cellfun(@(x) str2num(x),raw_data);
    
    n_points=obj.get(strcat(...
        obj.sens_prefix,':sweep:points'));
    
    if n_points*2==length(s_param)
        
        j=1;
        
        for i=1:2:length(s_param)
            
            s(j)=s_param(i)+1i*s_param(i+1);
            
            j=j+1;
            
        end
        
    end
      
    comm=strcat(obj.sens_prefix,':freq:data?');
    
    fprintf(obj.interfObj,comm);
    
    raw_data=split(fscanf(obj.interfObj),',');
    
    f=cellfun(@(x) str2num(x),raw_data);
    
end