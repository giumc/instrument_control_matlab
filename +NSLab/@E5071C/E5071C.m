classdef E5071C< InstrContr.VNA
    
    properties 
        
        active_trace=1;
        active_channel=1;
        
    end
    
    properties (Constant,Access=private)

        shortcut={InstrContr.Instrument.map_shortcut(...
            {'fstart','f_start',...
            'freq_start'},':freq:start');...
            InstrContr.Instrument.map_shortcut(...
            {'fstop','f_stop',...
            'freq_stop'},':freq:stop');...
            InstrContr.Instrument.map_shortcut(...
            {'fc','fcenter','f_center',...
            'freq_center'},':freq:center');...
            InstrContr.Instrument.map_shortcut(...
            {'fspan','f_span',...
            'freq_span'},':freq:span');...
            InstrContr.Instrument.map_shortcut(...
            {'points','pts'},':swe:poin');...
            InstrContr.Instrument.map_shortcut(...
            {'fbw','ifbw','if_bw',...
            'if_bandwidth'},':band:res');...
            InstrContr.Instrument.map_shortcut(...
            {'p','pow'},':pow');...
            InstrContr.Instrument.map_shortcut(...
            {'delay','del','sweep_delay'},':SWE:DEL');...
            InstrContr.Instrument.map_shortcut(...
            {'fcw','f_cw','freq_cw'},':freq:cw');...
            InstrContr.Instrument.map_shortcut(...
            {'sweeptype','sweep_type','sweep_t'},':sweep:type');...
            InstrContr.Instrument.map_shortcut(...
            {'pstart','p_start'},':pow:start');...
            InstrContr.Instrument.map_shortcut(...
            {'pstop','p_stop'},':pow:stop');...
            InstrContr.Instrument.map_shortcut(...
            {'pswitch','p_turn','turn','switch'},':output:state')};
        
        allowed_values={InstrContr.Instrument.map_allowed_values(...
            {'lin','log','pow'},...
            ':sweep:type');...
            InstrContr.Instrument.map_allowed_values(...
            {'on','off'},...
            ':out:state')};
        
        modal_commands={...
            InstrContr.Instrument.map_allowed_values(...
            {'fstart','fstop','fcenter','fspan',...
                'fcw','points','fbw','sweeptype','delay'},...
            'sens_prefix');...
            InstrContr.Instrument.map_allowed_values(...
            {'p','pstart','pstop'},'source_prefix');}

    end
    
    methods 
    
        function obj=E5071C(varargin)

            obj=obj@InstrContr.VNA(...
                    visa('ni','USB0::0x0957::0x0D09::MY46214220::INSTR'));
            
            obj.startup;
            
        end
            
    end
    
    methods %oneliners
        
        start_single_measurement(obj);
        
        set(obj,comm,varargin);
        
        y=get(obj,comm);
        
        function set_meas_display(obj,str)
           
            obj.set(strcat(obj.calc_prefix,":par1:def ",str));
            
        end
        
        function y=get_last_error(obj)
            
            y=obj.get(':syst:err?');
            
        end
        
        function set_auto_scale(obj)
            
            obj.set(":disp:wind1:trac1:y:scale:auto");
            
        end
        
        [x,y]=get_display_data(obj);
        
        startup(obj);
        
        function reset(obj)
            
            obj.set("*CLS");
            
        end
        
        [f,s]=one_port_measurement(obj);
        
        [f,s]=two_port_measurement(obj);
        
    end
    
    methods (Access=protected)
        
        [f,s]=get_sparam(obj,x,y);
        
        function y=sens_prefix(obj)
            
            y=strcat(':sens',num2str(obj.active_trace));
            
        end
        
        function y=calc_prefix(obj)
            
            y=strcat(':calc',num2str(obj.active_trace));
            
        end
        
        function y=source_prefix(obj)
            
            y=strcat(':sour',num2str(obj.active_trace));
            
        end
        
    end
    
    methods (Static)
        
        save_as_sparam(f,s,name);
        
    end
    
end