classdef RectMeas < handle
    
    properties (SetAccess=protected)
        
        osc
        
        rf_sig_gen
        
    end
    
    properties (Access=protected)
       
        outcome;
        
        averaged_outcome;
        
    end
    
    methods
        
        data = runExperiment(obj, freq, pow,ch)
        
        data = extractAverage(obj)
         
    end
   
    methods %Constructors / Destructors
        
        function delete(obj)
            
            fclose(obj.osc.interfObj);
            
            fclose(obj.rf_sig_gen.interfObj);
            
        end
        
    end
    
    methods  % One liners

        function set_osc(obj,instr)
            
            obj.osc=instr;
            
        end
        
        function set_rf_sig_gen(obj,instr)
           
            obj.rf_sig_gen=instr;
            
        end
        
    end
    
end