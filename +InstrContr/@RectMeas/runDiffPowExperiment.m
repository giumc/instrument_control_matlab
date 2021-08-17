function outcome=runDiffPowExperiment(obj,freq,power)

    obj.collectData(freq,power,[1 2]);
    
    obj.calcAverage;
    
    obj.calcAverageDifference;
    
    obj.calcData('average_diff',@(x) x.^2/1.5e3,'diff_power');
    
    outcome=obj.outcome;
    
end