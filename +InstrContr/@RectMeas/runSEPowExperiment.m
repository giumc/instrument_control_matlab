function outcome=runSEPowExperiment(obj,freq,power,varargin)

    obj.collectData(freq,power,[1 2],varargin{:});
    
    obj.calcAverage;
    
    obj.calcChPower(1.5e3);
    
    obj.calcTotPower;

    obj.calcEfficiency;
    
    outcome=obj.outcome;
    
end