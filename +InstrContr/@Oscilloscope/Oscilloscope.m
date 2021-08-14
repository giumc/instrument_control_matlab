classdef Oscilloscope < InstrContr.Instrument
        
    properties (Access=protected)
        
        input_buffer_size = 1e3;
        
        output_buffer_size = 2^9;
        
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
            %very high input buffer size to be able to collect more data
   
            obj.setPoints(1000);
           
        end
    
    end
    
    methods %One liners
    
        function setAutoScale(obj)
            
            obj.set('autoscale')
            
        end
        
        function setTimeScale(obj, scale)

            obj.set('timebase:scale ',scale);

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