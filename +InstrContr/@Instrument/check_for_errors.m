function check_for_errors(obj)

    obj.interfObj.writeline("*ESR?");
    
    pause(1);
    
    try
        
        msg=obj.interfObj.readline();
        
        
        if isempty(msg)
            
            error("No output after ESR query");
            
        end
        
    catch exception
        
        error("Error while reading ESR :\n%s",exception.message);
        
    end
    
    error_bin=obj.to_binary(msg,8);
    
    if str2double(error_bin)
        
        msg=sprintf("ESR has returned error %s :\n",error_bin);
        
        if str2double(error_bin(8))
            
            msg=strcat(msg,"OPC asserted\n");
            
        end
            
        if str2double(error_bin(6))
            
            msg=strcat(msg,"Query Error\n");
            
        end
            
%             query_err=str2double(writeread(obj.interfObj,'*QER?'));
%             
%             switch query_err
%                 
%                 case 1
%                     
%                     msg=strcat(msg,'INTERRUPTED');
%                     
%                 case 2
%                     
%                     msg=strcat(msg,'DEADLOCK');
%                     
%                 case 3
%                     
%                     msg=strcat(msg,'UNTERMINATED');
% 
%             end

        if str2double(error_bin(4))

            msg=strcat(msg,"Execution Error\n");
  
        end
        
        if str2double(error_bin(3))

            msg=strcat(msg,"Command Error\n");

        end
        
        if str2double(error_bin(1))

            msg=strcat(msg,"Power On\n");
        
        end
        
        error(sprintf(msg));
        
    end
    
end