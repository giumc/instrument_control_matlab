function outcome=runExperiment(obj, freq, pow, ch)

% This functions allows to make a frequency sweep for the energy harvester
% (EH) testing. FREQ is a vector with the frequencies of the sweep, POW is
% the power in dBm, ch is a vector with the oscilloscope's channels to record
% if varargin is passed, it has to be an function to apply to signals.
   
    rf_sg=obj.rf_sig_gen;

    osc=obj.osc;

    for i = 1:length(pow)
        
        for j = 1:length(freq)
            
            f=freq(j);
            
            p=pow(i);
            
            period=1/f;

            osc.setTimeScale(period/2);
            
            rf_sg.setRfFreq(f);
                
            rf_sg.setRfPower(p);
            
            fwrite(obj.osc.interfObj, 'run')
    
            for k=1:length(ch)

                [t,v] = obj.osc.get_Channel(ch(k));
                
                channel_data(k).t=t;
                channel_data(k).v=v;
                
            end
            
            outcome(i,j).data=channel_data;
            
            outcome(i,j).freq=f;
            
            outcome(i,j).power=p;
            
        end

    end
    
    obj.outcome=outcome;
    
end