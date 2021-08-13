classdef Measurement < handle
    
    properties
        
        osc
        mod
        tek
        
    end
    
    properties  (Hidden)

        EHtimeScale = 100e-9;
        
    end

     
    methods
        
        wout = DCFsweep(obj, freq, pow, chP, chN)
        
        wout = DCPsweep(obj, freq, pow, ch, varargin)
        
        diff = EHPsweep(obj, freq, pow, chP, chN)
        
        setUpM(obj, freqM, points)
        
        str=WURX_acquire_data(obj, freq, pow, Nbit, Nit, freqM, chComp, errorType,varargin)       
        
        WURX_calc_error()
        
        [errMean, errVar] = WURXerrRatevsF(obj, freq, pow, Nbit, Nit, freqM, chComp, errorType,varargin)
        
        deleteM(obj)
 
        function diff=Diff_FSweep(obj,freq,pow,ch)
            
            diff=obj.DCFsweep(freq,pow,ch,@(x) x(ch(1))-x(ch(2)));
            
            end
         
    end
   
    methods  % Constructors

        function set_oscilloscope(obj,instr)
            
            obj.osc=instr;
            
        end
        
        function set_sig_gen(obj,instr)
            
            obj.mod=instr;
            
        end
        
        function set_rf_sig_gen(obj,instr)
           
            obj.tek=instr;
            
        end
        
    end
    
end