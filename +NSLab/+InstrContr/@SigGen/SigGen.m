classdef SigGen < InstrContr.Instrument
    
    properties (Access=protected)
        
        input_buffer_size = 2^8;
        
        output_buffer_size = 2^16;
        
    end
    
    methods  % Constructors
         
        function obj = SigGen(varargin)
           
            obj=obj@InstrContr.Instrument(varargin{1});
        
            disp(strcat('SigGen :',obj.id))

        end
        
    end
    
end

