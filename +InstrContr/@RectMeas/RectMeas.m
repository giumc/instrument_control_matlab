classdef RectMeas < handle
    
    properties
        
        osc
        
        rf_sig_gen
        
    end
    
    properties (Access=protected)
       
        outcome;
        
        averaged_outcome;
        
    end
    
    methods
        
        data = runExperiment(obj, freq, pow, chP, chN)
        
        data = extractAverage(obj);
         
    end
   
    methods %Constructors / Destructors
        
        function delete(obj)
            
            fclose(obj.osc.interfObj);
            delete(obj.osc.interfObj);
            fclose(obj.rf_sig_gen.interfObj);
            delete(obj.rf_sig_gen.interfObj);

        end
        
    end
    
    methods  % One liners

        function set_osc(obj,instr)
            
            obj.osc=instr;
            
        end
        
        function set_rf_sig_gen(obj,instr)
           
            obj.sig_gen=instr;
            
        end
        
    end
    
end