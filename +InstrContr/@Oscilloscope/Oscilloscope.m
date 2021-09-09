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

        delay_trigger(obj, idleTime, channelN)

        data = get_channels(obj, channelN)
        
        data=calc_channels(obj,fields_in,fun,field_out)
        
        scale=get_preamble(obj)
        
        plot_channel_data(obj,ax,ch)
        
    end
   
    methods  % Constructors
        
        function obj = Oscilloscope(varargin)
          
            obj=obj@InstrContr.Instrument(varargin{:});
            
            disp(fprintf('Oscilloscope :\n %s',obj.id))
            
        end
    
    end
    
    methods %One liners
    
        function set_auto_scale(obj)
            
            obj.set('autoscale')
            
        end
        
        function set_time_scale(obj, scale)

            obj.set(':timebase:scale',scale);

        end
        
        function set_channel_scale(obj,chN,scale_V)
        
            chN=obj.format_input(chN);
            
            for i=1:length(chN)
                
            obj.set([':channel',chN(i),':scale'],scale_V);
            
            end
            
        end
        
        function y=get_channel_scale(obj,chN)
            
            y=obj.get([':channel',obj.format_input(chN),':scale']);
            
        end
        
        function set_ext_trig(obj)
            
            obj.set('trigger:source','ext')
            
        end
        
        function set_trig_channel(obj,ch)
            
            obj.set('trigger:source',ch);
            
        end
        
        function activate_BW_limit(obj,ch)
            
            obj.setup_channel(ch,':BWLimit',1);
            
        end
        
        function deactivate_BW_limit(obj,ch)
            
            obj.setup_channel(ch,':BWLimit',0);
            
        end
        
        function setBWLimit(obj,ch,val)
            
            obj.setup_channel(ch,':bandwidth',val);
            
        end
        
        function setPoints(obj,n)
            
            obj.set('waveform:points',n)
            
        end
        
        function activateChannel(obj,chN)
            
            obj.setup_channel(chN,':display',1);            
            
        end
        
        function deactivateChannel(obj,chN)

            obj.setup_channel(chN,':display',0);
        
        end
        
        function set_average_acquire(obj,points)
            
            obj.set(':acquire:type','aver');
            
            obj.set(':acquire:count',obj.format_input(points));
        
        end
        
        function set_normal_acquire(obj)
            
            obj.set(':acquire:type','norm');
            
        end
        
    end
    
   	methods (Access=protected)
    
        function setup_channel(obj,ch,param,val)
            
            val=obj.format_input(val);
            
            ch=obj.format_input(ch);
           
            for i=1:length(ch)

                obj.set([':channel',ch(i),param],val);

            end
            
        end
        
        data=get_channel(obj,chN);
        
    end
    
    methods (Static,Access=protected)
        
        data=calc_channel(data,fields_in,fun,field_out)
        
    end
    
end