classdef Oscilloscope < InstrContr.Instrument
        
    properties (Access=protected)
        
        input_buffer_size = 1e3;
        
        output_buffer_size = 2^9;
        
    end
    
    properties
        
        Npoints = 1000;
        
    end
        
    methods
        
        autoscale(obj);
        
        delayTrigger(obj, idleTime, channelN)
        
        setTimeScale(obj, scale)
    
        setOutPoints(obj, Npoints)
        
        [xaxis, waveform] = getChannel(obj, channelN)
            
        extTrig(obj)
        
        setTrigger(obj, tSweep, triggerLevel, channelN)
        
        setBWLimit(obj, ch)

    end
   
    methods  % Constructors
        
        function obj = Oscilloscope(varargin)
          
            obj=obj@InstrContr.Instrument(varargin{:});
            
            disp(fprintf('Oscilloscope :\n %s',query(obj.interfObj, '*IDN?')))
            %very high input buffer size to be able to collect more data
   
            fwrite(obj.interfObj, 'waveform:format ascii') % the data are in ASCII format

            setPoints = 'waveform:points ' + string(obj.Npoints);

            fwrite(obj.interfObj, setPoints) % sets the number of gathered points

        end
    
    end
end