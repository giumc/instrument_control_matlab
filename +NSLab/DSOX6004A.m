classdef DSOX6004A < InstrContr.Oscilloscope
    
    methods
    
        function obj=DSOX6004A(varargin)
            
            obj=obj@InstrContr.Oscilloscope(...
                visa('ni', 'USB0::0x0957::0x1780::MY56270554::INSTR'));
            
        end
        
    end
    
end