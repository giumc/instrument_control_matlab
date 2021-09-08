classdef Oscilloscope < InstrContr.Instrument
        
    properties (Access=protected)
        
        input_buffer_size = 1e6;
        
        output_buffer_size = 5^9;
        
        data;
        
    end
    
    properties
        
        points=2500;
        
    end

    methods

        delayTrigger(obj, idleTime, channelN)

        data = getChannels(obj, channelN)
        
        data=calcChannels(obj,fields_in,fun,field_out)
            
        setTrigger(obj, tSweep, triggerLevel, channelN)
        
        scale=getPreamble(obj)
        
        plotChannelData(obj,ax,ch)
        
    end
   
    methods  % Constructors
        
        function obj = Oscilloscope(varargin)
          
            obj=obj@InstrContr.Instrument(varargin{:});
            
            disp(fprintf('Oscilloscope :\n %s',obj.id))
            
        end
    
    end
    
    methods %One liners
    
        function setAutoScale(obj)
            
            obj.set('autoscale')
            
        end
        
        function setTimeScale(obj, scale)

            obj.set(':timebase:scale',scale);

        end
        
        function setChannelScale(obj,chN,scale_V)
        
            chN=obj.format_input(chN);
            
            for i=1:length(chN)
                
            obj.set([':channel',chN(i),':scale'],scale_V);
            
            end
            
        end
        
        function y=getChannelScale(obj,chN)
            
            y=obj.get([':channel',obj.format_input(chN),':scale']);
            
        end
        
        function setExtTrig(obj)
            
            obj.set('trigger:source','ext')
            
        end
        
        function setTrigChannel(obj,ch)
            
            obj.set('trigger:source',ch);
            
        end
        
        function activateBWLimit(obj,ch)
            
            obj.setupChannel(ch,':BWLimit',1);
            
        end
        
        function deactivateBWLimit(obj,ch)
            
            obj.setupChannel(ch,':BWLimit',0);
            
        end
        
        function setBWLimit(obj,ch,val)
            
            obj.setupChannel(ch,':bandwidth',val);
            
        end
        
        function setPoints(obj,n)
            
            obj.set('waveform:points',n)
            
        end
        
        function activateChannel(obj,chN)
            
            obj.setupChannel(chN,':display',1);            
            
        end
        
        function deactivateChannel(obj,chN)

            obj.setupChannel(chN,':display',0);
        
        end
        
        function setAverageAcquire(obj,points)
            
            obj.set(':acquire:type','aver');
            
            obj.set(':acquire:count',obj.format_input(points));
        
        end
        
        function setNormalAcquire(obj)
            
            obj.set(':acquire:type','norm');
            
        end
        
    end
    
   	methods (Access=protected)
    
        function setupChannel(obj,ch,param,val)
            
            val=obj.format_input(val);
            
            ch=obj.format_input(ch);
           
            for i=1:length(ch)

                obj.set([':channel',ch(i),param],val);

            end
            
        end
        
        data=getChannel(obj,chN);
        
    end
    
    methods (Static,Access=protected)
        
        data=calcChannel(data,fields_in,fun,field_out)
        
    end
    
end