classdef SigGen < InstrContr.Instrument
    
    properties (Access=protected)
        
        input_buffer_size = 2^9;
        
        output_buffer_size = 2^11;
        
    end
    
    methods
        
        arbMod(obj, points, name, freqMod)
    
    end

    methods  % Constructors
         
        function obj = SigGen(varargin)
           
            obj=obj@InstrContr.Instrument(varargin{1});
        
            disp(fprintf('SigGen :\n %s',query(obj.interfObj, '*IDN?')))

        end
        
    end
    
end

