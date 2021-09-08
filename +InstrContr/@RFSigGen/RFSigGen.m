classdef RFSigGen < InstrContr.Instrument
    
    properties (Access=protected)
        
        input_buffer_size = 2^9;
        
        output_buffer_size = 2^11;
        
        rf_gain=0;
        
    end
    
    methods
        
        ModOff(obj)

        ModOn(obj)

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
            fwrite(obj.interfObj,'ENBR1')
        end
        
        function stop(obj)
            fwrite(obj.interfObj,'ENBR0')
        end
        
        function setRfFreq(obj,f)
            
            obj.set('FREQ',f);
            
        end
        
        function setRfPower(obj,p)
            
            obj.set('AMPR',p-obj.rf_gain);
            
        end
        
        function setRfGain(obj,gain)
            
            obj.rf_gain=gain;
            
        end
        
    end
    
end

