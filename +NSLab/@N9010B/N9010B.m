classdef N9010B< InstrContr.SpectrumAnalyzer

    properties (Constant,Access=private)
        
        shortcut={InstrContr.Instrument.map_shortcut(...
            {'fstart','f_start',...
            'freq_start'},':freq:rf:start');...
            InstrContr.Instrument.map_shortcut(...
            {'fstop','f_stop',...
            'freq_stop'},':freq:rf:stop');...
            InstrContr.Instrument.map_shortcut(...
            {'fc','fcenter','f_center',...
            'freq_center'},':freq:rf:center');...
            InstrContr.Instrument.map_shortcut(...
            {'fspan','f_span',...
            'freq_span','span'},':freq:span');...
            InstrContr.Instrument.map_shortcut(...
            {'points','pts'},':swe:poin');...
            InstrContr.Instrument.map_shortcut(...
            {'fbw','ifbw','if_bw',...
            'if_bandwidth'},':band:res')};
        
        modal_commands={InstrContr.Instrument.map_allowed_values(...
            {'fstart','fstop','fcenter','fspan',...
                'points','fbw'},...
            'sens_prefix')};
        
        allowed_values={};

    end
    
    methods 

        function obj=N9010B(varargin)

            obj=obj@InstrContr.SpectrumAnalyzer(...
                    visa('ni','USB0::0x2A8D::0x1B0B::MY59070517::0::INSTR'));
            
        end
            
    end
    
    methods 
       
        set(obj,comm,varargin);
        
        y=get(obj,comm);
        
        [x,y]=get_spectrum(obj);
        
    end

    methods %Oneliners
        
        
        function auto_scale(obj)
            
            obj.set(':disp:acpower:view:window:trace:y:scale:couple',1);
            
        end
   
    end
    
    methods (Access=protected)

        function y=sens_prefix(obj)
            
            y=':sens';
            
        end
  
    end

end