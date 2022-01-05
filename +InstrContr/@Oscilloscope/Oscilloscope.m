classdef Oscilloscope < InstrContr.Instrument
        
    properties (Access=protected)
        
        input_buffer_size = 1e6;
        
        output_buffer_size = 5^9;
        
        data;
        
    end
    
    properties 
        
          points=2048;
        
    end
    
    methods  % Constructors
        
        function obj = Oscilloscope(visa)
          
            obj@InstrContr.Instrument(visa);
            
            disp(fprintf('Oscilloscope :\n %s',obj.id))
            
        end
        
    end
    
    methods (Access=protected)
        
        [t,y]=clean_data(obj,t,y);
        
    end
    
end