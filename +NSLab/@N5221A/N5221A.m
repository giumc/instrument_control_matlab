classdef N5221A<NSLab.E5071C & InstrContr.VNA

    methods

        function obj=N5221A(varargin)

                obj=obj@InstrContr.VNA(...
                        visa('ni',...
                        'USB0::0x0957::0x0118::MY56011522::INSTR'));

        end
        
    end
    
end