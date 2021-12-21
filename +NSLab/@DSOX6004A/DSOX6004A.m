classdef DSOX6004A < InstrContr.Oscilloscope
    
    properties (Access=private,Constant)
        
        channel_colors=['g','y','b','r'];
        
    end
    
    methods
    
        function obj=DSOX6004A()
            
            obj=obj@InstrContr.Oscilloscope(...
                visa('ni','USB0::0x0957::0x1780::MY56270554::INSTR'));
            
        end
        
        function reset(obj)
            
            obj.set(':system:preset');
            
        end
        
    end
    
    methods

        delay_trigger(obj, idleTime, channelN)

        data = get_channels(obj, channelN)

        data=calc_channels(obj,fields_in,fun,field_out)

        scale=get_preamble(obj)

    end
    
    methods
  
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
        
         function set_channel_offset(obj,chN,scale_V)
        
            chN=obj.format_input(chN);
            
            for i=1:length(chN)
                
            obj.set([':channel',chN(i),':offset'],scale_V);
            
            end
            
        end
        
        function y=get_channel_scale(obj,chN)
            
            y=obj.get([':channel',obj.format_input(chN),':scale']);
            
        end
        
        function y=get_channel_offset(obj,chN)
            
            y=obj.get([':channel',obj.format_input(chN),':offset']);
            
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
        
        function set_BW_limit(obj,ch,val)
            
            obj.setup_channel(ch,':bandwidth',val);
            
        end
        
        function set_points(obj,n)
            
            obj.set('waveform:points',n)
            
        end
        
        function activate_channel(obj,chN)
            
            obj.setup_channel(chN,':display',1);            
            
        end
        
        function deactivate_channel(obj,chN)

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
        
        plot_channel_data(obj,ax,ch);
        
    end

    methods (Static,Access=protected)
        
        data=calc_channel(data,fields_in,fun,field_out)
        
    end
        
end