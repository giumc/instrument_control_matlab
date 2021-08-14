function outcome=runExperiment(obj, freq, pow, ch)

% This functions allows to make a frequency sweep for the energy harvester
% (EH) testing. FREQ is a vector with the frequencies of the sweep, POW is
% the power in dBm, ch is a vector with the oscilloscope's channels to record
% if varargin is passed, it has to be an function to apply to signals.
   
    clc
    
    rf_sg=obj.rf_sig_gen;
    InstrContr.dispstat('','init');
    InstrContr.dispstat("Running measurement...",'keepthis');
    
    osc=obj.osc;
    
    
    for i = 1:length(pow)
        
        for j = 1:length(freq)
            
            f=freq(j);
            
            p=pow(i);
            
            InstrContr.dispstat(...
                strcat(...
                    sprintf("Freq set to %.3e MHz",f/1e6),...
                    sprintf("Power set to %.3e dBm",p)));
                
            period=1/f;

            osc.setTimeScale(period/2);
            
            rf_sg.setRfFreq(f);
                
            rf_sg.setRfPower(p);
            
            rf_sg.start;
            
            fwrite(obj.osc.interfObj, 'run')
            
            for k=1:length(ch)

                [t,v] = obj.osc.getChannel(ch(k));
                
                channel_data(k).t=t;
                channel_data(k).v=v;
                
            end
            
            rf_sg.stop;
            
            outcome(i,j).data=channel_data;
            
            outcome(i,j).freq=f;
            
            outcome(i,j).power=p;
         
        end

    end
  
    obj.outcome=outcome;
    
end