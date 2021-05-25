classdef Measurement < matlab.mixin.Copyable & handle
    
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
        
        diff = DCFsweep(obj, freq, pow, chP, chN)

        diff = EHPsweep(obj, freq, pow, chP, chN)
        
        setUpM(obj, freqM, points)
        
        [errMean, errVar] = WURXerrRatevsP(obj, freq, pow, Nbit, Nit, freqM, chComp)       
        
        [errMean, errVar] = WURXerrRatevsF(obj, freq, pow, Nbit, Nit, freqM, chComp)
        
        closeM(obj)
        
        function diff=Diff_FSweep(obj,freq,pow,ch)
            
            diff=obj.DCFSweep(freq,pow,ch,@(x) x(ch(1))-x(ch(2)));
            
            end
         
    end
   
    methods  % Constructors
        
        function obj = Measurement(osc, sg, mod)
            % IP is a string with the IP address
            
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