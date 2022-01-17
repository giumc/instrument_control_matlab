function save_as_sparam(f,s,name)

    try
        
        s_conv=zeros(2,2,length(f));
        
        for i=1:length(f)
            
            s_conv(1,1,i)=s.s11(i);
            
            s_conv(1,2,i)=s.s12(i);
            
            s_conv(2,1,i)=s.s21(i);
            
            s_conv(2,2,i)=s.s22(i);
            
        end
        
        term='.s2p';
        
    catch
        
        s_conv=zeros(1,1,length(f));
        
        for i=1:length(f)
            
            s_conv(1,1,i)=s.s11(i);
            
        end
        
        term='.s1p';
        
    end
    
    sparam=sparameters(s_conv,f);

    if ~endsWith(name,term,'IgnoreCase',true)
        
        name=strcat(name,term);
        
    end
   
    rfwrite(sparam,name);
   
end