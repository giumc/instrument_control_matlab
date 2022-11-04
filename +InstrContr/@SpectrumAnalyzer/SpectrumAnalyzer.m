classdef SpectrumAnalyzer< InstrContr.Instrument
    
     properties (Access=protected)
        
        input_buffer_size = 2^21;
        
        output_buffer_size = 2^11;

        
     end 
    
    properties (Access=protected)
        
        data;
        
    end

    methods  % Constructors
        
        function obj = SpectrumAnalyzer(visa)
          
            obj@InstrContr.Instrument(visa);
            
            disp(fprintf('SpectrumAnalyzer:\n %s',obj.id))
            
        end
        
    end

end