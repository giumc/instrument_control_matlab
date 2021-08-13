classdef TSG4104A < InstrContr.RFSigGen
    
    methods
    
        function obj=TSG4104A(varargin)
            
            obj=obj@InstrContr.RFSigGen(...
                visa('ni', 'TCPIP0::10.233.16.132::inst0::INSTR'));
        end
        
    end
    
end