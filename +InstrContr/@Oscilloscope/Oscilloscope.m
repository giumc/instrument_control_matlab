classdef Oscilloscope < InstrContr.Instrument
        
    properties (Access=protected)
        
        input_buffer_size = 1e6;
        
        output_buffer_size = 5^9;
        
    end
    
    properties
        
        points=2500;
        
    end

    methods

        delayTrigger(obj, idleTime, channelN)

        [xaxis, waveform] = getChannel(obj, channelN)
            
        setTrigger(obj, tSweep, triggerLevel, channelN)
        
        scale=getScale(obj)

    end
   
    methods  % Constructors
        
        function obj = Oscilloscope(varargin)
          
            obj=obj@InstrContr.Instrument(varargin{:});
            
            disp(fprintf('Oscilloscope :\n %s',obj.id))
            
        end
    
    end
    
    methods %One liners
    
        function setAutoScale(obj)
            
            obj.set('autoscale:channels''all')
            
        end
        
        function setTimeScale(obj, scale)

            obj.set(':timebase:scale',scale);

        end
        
        function setExtTrig(obj)
            
            obj.set('trigger:source','ext')
            
        end
        
        function setBWLimit(obj,ch)
            
            obj.set(['channel',ch,'BWLimit','1']);
            
        end
        
        function setPoints(obj,n)
            
            obj.set('waveform:points',n)
            
        end
        
    end
    
end