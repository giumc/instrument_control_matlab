classdef TGP3152 < InstrContr.SigGen
    
    properties (Access=private,Constant)
        
        serial_number={'481129','451746','451745'}
        
        tracking_option={'OFF','EQUAL','INVERT'}
        
        clock_source_option={'INT','EXT'};
        
        maps={InstrContr.Instrument.map_entries(...
            {'m','mode'},'MODE');...
            InstrContr.Instrument.map_entries(...
            {'f','freq',},'FREQ');...
            InstrContr.Instrument.map_entries(...
            {'w','width'},'WID');...
            InstrContr.Instrument.map_entries(...
            {'dc','d','dutycycle','duty cycle',...
                'symmetry'},'SYMM');...
            InstrContr.Instrument.map_entries(...
            {'p','phase','angle'},'PHASE');...
            InstrContr.Instrument.map_entries(...
            {'zl','z_l','zload','z_load'},'ZLOAD');...
            InstrContr.Instrument.map_entries(...
            {'zs','z_s','zsource','z_source'},'ZSRC');...
            InstrContr.Instrument.map_entries(...
            {'c','chan','channel'},'CHN')};
        
    end
    
    properties
       
        mode {mustBeMember(mode,...
            {'PULSE','SQUARE','DOUBLEPULSE','PATTERN',...
            'NOISE','SINE','RAMP','TRIANG'})}='PULSE';
        
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
                
                error("Wrong TGP3152 connected");

            end

        end
        
        set(obj,comm,varargin);
        
    end
    
    methods
        
        function set_clock_source(obj,v)
            
            mustBeMember(v,obj.clock_source_option);
            
            obj.set('CLKSRC',v);
            
        end
        
        function couple_amplitude(obj,v)
            
            obj.set('AMPLCPLNG',v);
            
        end
        
        function couple_frequency_mode(obj,v)
            
            obj.set('FRQCPLSWT',v);
            
        end
        
        function couple_frequency_ratio(obj,v)
            
            obj.set('FRQCPLRAT',v);
            
        end
        
        function set_tracking_mode(obj,v)
            
            mustBeMember(v,obj.tracking_option);
            
            obj.set('TRACKING',v);
            
        end
        
    end
    
    methods (Access=protected)
        
        function tag=mode_prefix(obj)
            
            switch obj.mode
                
                case 'PULSE'
                    
                    tag='PULS';
                    
                case 'SQUARE'
                    
                    tag='SQR';
                    
                otherwise
                    
                    error('tag for %s not covered yet',obj.mode);
                    
            end
            
        end
        
    end
     
    methods (Access=protected, Static)
        
        function tag=mode_command(cmd)
            
            tag=strcat(obj.mode_prefix,cmd);
            
        end
        
        
    end
     
    
end