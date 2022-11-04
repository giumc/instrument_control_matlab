classdef PowerSupply< InstrContr.Instrument

    methods  % Constructors
        
        function obj = PowerSupply(visa)
          
            obj@InstrContr.Instrument(visa);
            
            disp(fprintf('PowerSupply :\n %s',obj.id))
            
        end
        
    end

end