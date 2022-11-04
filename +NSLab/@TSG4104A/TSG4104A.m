 classdef TSG4104A < InstrContr.RFSigGen
    
    properties (Access=protected)
                
        rf_gain=0;
        
    end
    
    methods % Constructor
        
        function obj=TSG4104A(n,varargin)
            
            switch n
                
                case 1
                     
                    cmd={'ni', 'TCPIP0::10.233.16.132::inst0::INSTR'};
            
                case 2
                    
                    cmd={'keysight', 'GPIB0::2::INSTR'};
                    
                otherwise
                        
                    error ('N must be 1 for NSLAB or 2 for ECL tool');
                    
            end
            
            obj=obj@InstrContr.RFSigGen(visa(cmd{1},cmd{2}));
            
        end
           
    end
    
    methods
        
        set_mod_waveform(obj,type);
        
        set_mod_type(obj,type);
        
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
