classdef E4402B< InstrContr.SpectrumAnalyzer

    methods 
    
        function obj=E4402B(varargin)

            obj=obj@InstrContr.SpectrumAnalyzer(...
                    visa('keysight','GPIB0::18::INSTR'));
        end
            
    end
    
end