classdef VNA< InstrContr.Instrument
    
     properties (Access=protected)
        
        input_buffer_size = 2^21;
        
        output_buffer_size = 2^11;
        
        rf_gain=0;
        
     end 
    
    properties (Access=protected)
        
        data;
        
    end

    methods  % Constructors
        
        function obj = VNA(visa)
          
            obj@InstrContr.Instrument(visa);
            
            disp(fprintf('VNA :\n %s',obj.id))
            
        end
        
    end

end