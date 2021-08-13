classdef RFSigGen < InstrContr.Instrument
    
    properties (Access=protected)
        
        input_buffer_size = 2^9;
        
        output_buffer_size = 2^11;
        
    end
    
    methods
        
        ModOff(obj)

        ModOn(obj)

        setRfFreq(obj, freq)

        setRfPower(obj, pow)

        modulate(obj, modType, modWf, rate, depthOrDev)
        
    
    end

    methods  % Constructors
        
        function obj = RFSigGen(varargin)
           
            obj=obj@InstrContr.Instrument(varargin{1});
   
            disp(fprintf('RFSigGen :\n %s',obj.id))
            
            obj.stop;
            
        end
        
    end
    
    methods % Oneliners
    
        function start(obj)
            set(obj.interfObj,'ENBR1')
        end
        
        function stOP(obj)
            set(obj.interfObj,'ENBR0')
        end
        
    end
    
end

