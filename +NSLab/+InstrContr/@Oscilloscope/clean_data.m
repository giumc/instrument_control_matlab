function [t_out,y_out]=clean_data(obj,t,y)
     
    i_tbr=[];
    
    for i=length(t):-1:1
        
        if y(i)==0
            
            i_tbr=[i_tbr,i];
            
        else
            
            break;
            
        end
        
    end
    
    t_out=t;
    
    y_out=y;
    
    t_out(i_tbr)=[];
    
    y_out(i_tbr)=[];
            
end