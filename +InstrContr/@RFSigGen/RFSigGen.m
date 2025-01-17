classdef RFSigGen < InstrContr.Instrument
    
    properties (Access=protected)
        
        input_buffer_size = 2^9;
        
        output_buffer_size = 2^11;
        
        rf_gain=0;
        
    end
    
    methods
        
        set_mod_waveform(obj,type);
        
        set_mod_type(obj,type);
        
    end

    methods  % Constructors
        
        function obj = RFSigGen(varargin)
           
            obj=obj@InstrContr.Instrument(varargin{1});
   
            disp(fprintf('RFSigGen :\n %s',obj.id))
            
            obj.stop;
            
        end
        
    end
    
    methods % Oneliners
    
        function start(obj)
            fwrite(obj.interfObj,'ENBR1')
        end
        
        function stop(obj)
            fwrite(obj.interfObj,'ENBR0')
        end
        
        function start_mod(obj)
            
            obj.set('MODL',1);
            
        end
        
        function stop_mod(obj)
            
            obj.set('MODL',0);
            
        end
        
        function set_rf_freq(obj,f)
            
            obj.set('FREQ',f);
            
        end
        
        function set_rf_power(obj,p)
            
            obj.set('AMPR',p-obj.rf_gain);
            
        end
        
        function set_rf_gain(obj,gain)
            
            obj.rf_gain=gain;
            
        end
        
        function set_ampl_depth(obj,val)
            
            obj.set('ADEV',val);
            
        end
        
        function set_phase_depth(obj,val)
            
            obj.set('PDEV',val);
            
        end
        
        function set_freq_depth(obj,val)
            
            obj.set('FDEV',val);
            
        end
        
        function set_mod_rate(obj,val)
            
            obj.set('RATE',val);
            
        end
        
    end
    
end

