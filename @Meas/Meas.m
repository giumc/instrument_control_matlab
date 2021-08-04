classdef Meas < matlab.mixin.Copyable & handle
    
    properties
        
        osc;
        tek;
        mod;
    end
    
    properties  (Hidden)
        IPsg = '10.233.16.132';
        IPmod = '169.254.2.20';
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
        
        function obj = Meas(osc, sg, mod)
            % IP is a string with the IP address
            
            if nargin == 1
                
                if osc == 1
                    
                    return
                    
                end
                
            end
            if nargin == 0
                IPosc = input('Insert oscilloscope IP --> ');
                obj.osc = Osc(IPosc);
%                 IPsg = input('Insert Tektronix IP --> ');
%                 obj.tek = Tek(IPsg)
%                 IPmod = input('Insert LF generator IP --> ');
%                 obj.mod = LFGen(IPmod)
                
                obj.tek = Tek('10.233.16.132');
                obj.mod = LFGen('169.254.2.20');
                
            elseif nargin == 3
                obj.osc = osc;
                obj.tek = sg;
                obj.mod = mod;
            else
                disp('Wrong input argument number')
            end
            
        end
        
    end
    
end