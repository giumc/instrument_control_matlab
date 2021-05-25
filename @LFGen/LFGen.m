classdef LFGen < matlab.mixin.Copyable & handle
    
    properties
        IP = '169.254.2.20';
        interfObj;
    end
    
        %     properties (Access=protected)
%         
%         interfObj;
%         
%     end

    methods
        
        arbMod(obj, points, name, freqMod)
    
    end

    methods  % Constructors
        
        function obj = LFGen(IP)
            % IP is a string with the IP address
            if nargin == 1
                obj.IP = IP;
                constructor = ['TCPIP0::', IP, '::inst0::INSTR'];
                sgen = visa('keysight', constructor);
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

