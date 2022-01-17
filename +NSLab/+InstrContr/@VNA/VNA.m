classdef VNA< InstrContr.Instrument
        
    properties (Access=protected)
        
        data;
        
    end

    properties 
        
        active_trace=1;
        
    end
    
    methods  % Constructors
        
        function obj = VNA(visa)
          
            obj@InstrContr.Instrument(visa);
            
            disp(fprintf('VNA :\n %s',obj.id))
            
        end
        
    end

end