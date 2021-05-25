classdef Tek < matlab.mixin.Copyable & handle
    
    properties
        IP = '10.233.16.132';
        interfObj;
    end
    
    %     properties (Access=protected)
%         
%         interfObj;
%         
%     end

    methods
        
        ModOff(obj)

        ModOn(obj)

        setFreq(obj, freq)

        setPower(obj, pow)

        modulate(obj, modType, modWf, rate, depthOrDev)
        
    
    end

    methods  % Constructors
        
        function obj = Tek(IP)
            % IP is a string with the IP address
            if nargin == 1
                obj.IP = IP;
                constructor = ['TCPIP0::', IP, '::inst0::INSTR'];
                sgen = visa('ni', constructor);
                sgen.OutputBufferSize = 2048;
                fopen(sgen)
                name = query(sgen, '*IDN?');
                sprintf('Connection to %s', name(1:end-2))
            else
                disp('Too many input arguments')
            end
            
            obj.interfObj = sgen;
        end
        
    end
    
end

