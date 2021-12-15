classdef SigGen < InstrContr.Instrument
    
    properties (Access=protected)
        
        input_buffer_size = 2^8;
        
        output_buffer_size = 2^16;
        
    end
    
    methods  % Constructors
         
        function obj = SigGen(varargin)
           
            obj=obj@InstrContr.Instrument(varargin{1});
        
            disp(strcat('SigGen :',obj.id))

        end
        
    end
    
    methods %Oneliners
        
        function set_channel(obj,n)
            
            obj.set('CHN',n);
            
        end
        
        function set_freq(obj,f)
            
            obj.set('FREQ',f);
            
        end
        
        function set_hi_level(obj,v)
            
            obj.set('HILVL',v);
            
        end
        
        function set_low_level(obj,v)
            
            obj.set('LOLVL',v);
        
        end
        
        function set_dc_value(obj,v)
            
            obj.set('DCOFFS',v);
        
        end
        
        function set_amplitude(obj,v)
            
            obj.set('AMPL',v);
            
        end
        
        function set_output(obj,v)
            
            obj.set('OUTPUT',v);
            
        end
        
    end
    
end

