classdef RFSigGen < InstrContr.Instrument
    
    properties (Access=protected)
        
        input_buffer_size = 2^9;
        
        output_buffer_size = 2^11;

    end
    
    methods  % Constructors
        
        function obj = RFSigGen(varargin)
           
            obj=obj@InstrContr.Instrument(varargin{1});
   
            disp(fprintf('RFSigGen :\n %s',obj.id))
    
        end
        
    end
    
    
end

