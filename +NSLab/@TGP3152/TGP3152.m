classdef TGP3152 < InstrContr.SigGen
    
    properties (Access=private,Constant)
        
        serial_number={'481129','451746','451745'}
        
        allowed_values={...
            InstrContr.Instrument.map_allowed_values(...
            {'ON','OFF','EQUAL','INVERT'},'OUTPUT');...
            InstrContr.Instrument.map_allowed_values(...
            {'OFF','EQUAL','INVERT'},'TRACKING');...
            InstrContr.Instrument.map_allowed_values(...
            {'INT','EXT'},'CLKSRC');...
            InstrContr.Instrument.map_allowed_values(...
            {'MASTER','SLAVE','INDEP'},'LOCKMODE');};
        
        shortcut={InstrContr.Instrument.map_shortcut(...
            {'w','wave','m','mode'},'WAVE');...
            InstrContr.Instrument.map_shortcut(...
            {'f','freq',},'FREQ');...
            InstrContr.Instrument.map_shortcut(...
            {'dc','d','dutycycle','duty cycle',...
                'symmetry'},'SYMM');...
            InstrContr.Instrument.map_shortcut(...
            {'p','phase','angle'},'PHASE');...
            InstrContr.Instrument.map_shortcut(...
            {'zl','z_l','zload','z_load'},'ZLOAD');...
            InstrContr.Instrument.map_shortcut(...
            {'zs','z_s','zsource','z_source'},'ZSRC');...
            InstrContr.Instrument.map_shortcut(...
            {'c','chan','channel'},'CHN');...
            InstrContr.Instrument.map_shortcut(...
            {'t','track','tracking'},'TRACKING');...
            InstrContr.Instrument.map_shortcut(...
            {'o','out','output'},'OUTPUT');...
            InstrContr.Instrument.map_shortcut(...
            {'clk','clock','clksrc','clocksource'},'CLKSRC');...
            InstrContr.Instrument.map_shortcut(...
            {'lock','lockmode'},'LOCKMODE');...
            InstrContr.Instrument.map_shortcut(...
            {'hi','hilvl'},'HILVL');...
            InstrContr.Instrument.map_shortcut(...
            {'lo','lolvl'},'LOLVL');};
        
            wave_commands={'FREQ','PER','WID','SYMM','FALLDEL',...
                'EDGE','EDGESYMM','RISE','RYSESYMM','FALL','FALLSYM',...
                'DLY','DLYSYMM','LOAD','DCOFFS'};
        
    end
  
    properties (Access=private)
        
        tracking {mustBeMember(tracking,...
            {'OFF','EQUAL','INVERT'})} ='OFF';
       
        wave {mustBeMember(wave,...
            {'PULSE','SQUARE','DOUBLEPULSE','PATTERN',...
            'NOISE','SINE','RAMP','TRIANG','ARB'})}='PULSE';
       
        
    end
    
    methods
    
        function obj= TGP3152(n,varargin)
            
            switch n
                
                case {1,'1'}
                    
                    port='7';
                    
                case {2,'2'}
                    
                    port='6';
                    
                case {3,'3'}
                    
                    port='4';
            end
            
            obj=obj@InstrContr.SigGen(...
                visa('ni',...
                strcat('ASRL',port,'::INSTR')));
            
            if ~strcmp(obj.get_serial_number,obj.serial_number{n})
                
                keyboard;
                
                error("Wrong TGP3152 connected");

            end

        end
        
        set(obj,comm,varargin);
        
        y=get(obj,comm,varargin);
        
        set_channel_param(obj,i,varargin);
        
        function y=get_last_error(obj)
            
            y=obj.get('EER?');
            
        end
        
        function set_both_channels_param(obj,varargin)
       
            if strcmp(obj.tracking,'OFF')
                
                obj.set_channel_param(1,varargin{:});

                obj.set_channel_param(2,varargin{:});
                
            else
                
                obj.set_channel_param(1,varargin{:});
                
            end 
            
        end
        
    end
    
    methods (Access=protected)
        
        function tag=wave_prefix(obj)
            
            switch obj.wave
                
                case 'PULSE'
                    
                    tag='PULS';
                    
                case 'SQUARE'
                    
                    tag='SQR';
                    
                case 'ARB';
                    
                    tag='ARB';
                    
                otherwise
                    
                    error('tag for %s not covered yet',obj.mode);
                    
            end
            
        end

        function tag=wave_command(obj,cmd)
            
            tag=strcat(obj.wave_prefix,cmd);
            
        end
 
    end
     
    
end