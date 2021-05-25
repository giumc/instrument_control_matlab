classdef Osc < matlab.mixin.Copyable & handle
    
    properties
        
        IP char; % sample name 
        Npoints = 1000;
        interfObj;
    end
    
%     properties (Access=protected)
%         
%         interfObj;
%         
%     end
%     
    methods
        
        autoscale(obj);
        
        delayTrigger(obj, idleTime, channelN)
        
        setTimeScale(obj, scale)
    
        setOutPoints(obj, Npoints)
        
        [xaxis, waveform] = getChannel(obj, channelN)
            
        extTrig(obj)
        
        setTrigger(obj, tSweep, triggerLevel, channelN)

    end
   
    methods  % Constructors
        
        function obj = Osc(IP)
            % IP is a string with the IP address
            
            if nargin == 1
                obj.IP = IP;
                constructor = ['TCPIP0::', IP, '::inst0::INSTR'];
                oscilloscope= visa('keysight', constructor);
                oscilloscope.InputBufferSize=100000000; %very high input buffer size to be able to collect more data
                fopen(oscilloscope)
                name = query(oscilloscope, '*IDN?');
                sprintf('Connection to %s', name(1:end-2))
            else
                disp('Too many input arguments')
            end
           
            obj.interfObj=oscilloscope;
            
            fwrite(obj.interfObj, 'waveform:format ascii') % the data are in ASCII format
            setPoints = 'waveform:points ' + string(obj.Npoints);
            fwrite(obj.interfObj, setPoints) % sets the number of gathered points
            
        end
        
    end
    
end