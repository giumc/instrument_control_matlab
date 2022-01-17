function set_mod_type(obj, mod_type)
%   set_mod_type(obj, mod_type, modWf, rate, depthOrDev)
%   mod_type can be 'AM', 'FM' or 'phiM'.
%   depth can be 0<100
    
   switch mod_type

       case 'AM'
            obj.set('TYPE',0);

       case 'FM'
            obj.set('TYPE',1);
        
       case 'phiM'

            obj.set('TYPE',2);
            
        otherwise
            
            error(strcat(...
                sprintf("Wrong Modulation Type %s",mod_type),...
                sprintf("Allowed Values are 'AM','FM','PM'")));
            
    end
       
end
   