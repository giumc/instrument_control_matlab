classdef RFSigGen < InstrContr.Instrument
    
    properties (Access=protected)
        
        input_buffer_size = 2^9;
        
        output_buffer_size = 2^11;
        
    end
    
    methods
        
        ModOff(obj)

        ModOn(obj)

        setFreq(obj, freq)

        setPower(obj, pow)

        modulate(obj, modType, modWf, rate, depthOrDev)
        
    
    end

    methods  % Constructors
        
        function obj = RFSigGen(varargin)
           
            obj=obj@InstrContr.Instrument(varargin{1});
   
            disp(fprintf('RFSigGen :\n %s',query(obj.interfObj, '*IDN?')))

        end
        
    end
    
end

