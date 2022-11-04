function [x,y]=get_spectrum(obj)

    obj.start_single_measurement;
    
    obj.interfObj.Timeout=100;
    
    d=obj.get(':calc:data');
    
    raw_data=split(d,',');
    
    d=cellfun(@(x) str2num(x),raw_data);
    
    x=zeros(1,length(d)/2);
    
    y=zeros(1,length(d)/2);
    
    j=1;
    
    for i=1:length(d)
        
        if mod(i,2)==0
            
            y(j)=d(i);
        
            j=j+1;
            
        else
            
            x(j)=d(i);
            
        end
        
    end
            
end 
