function outcome=collect_data(obj, freq, pow, ch,varargin)

% This functions allows to make a frequency sweep for the energy harvester
% (EH) testing. FREQ is a vector with the frequencies of the sweep, POW is
% the power in dBm, ch is a vector with the oscilloscope's channels to record
% if varargin is passed, it has to be an function to apply to signals.
  
    plt=InstrContr.Tools.check_if_string_is_present(varargin,'plot');
    
    rf_sg=obj.rf_sig_gen;
    
    osc=obj.osc;
    
    rf_sg.start;
    
    f=freq(1);
    
    p=pow(1);
    
    rf_sg.set_rf_freq(f);
    
    rf_sg.set_rf_power(p);
    
    rf_sg.start;
    
    ch=obj.osc.format_input(ch);
    
    osc.activate_channel(ch);
    
    outcome=struct('freq',{},'power',{},'data',{});
    
    bar=waitbar(0,'','Name','Running Experiment',...
        'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
    
    setappdata(bar,'canceling',0);
    
    glb_counter=0;
    
    tot_pass=length(pow)*length(freq);
    
    if plt
        
        fig_plot=figure;
    
        ax_plot=axes;
        
    end
    
    for i = 1:length(pow)
        
        for j = 1:length(freq)
            
            glb_counter=glb_counter+1;
            
            if getappdata(bar,'canceling')
                
                outcome=struct('freq',{},'power',{},'data',{});
                
                obj.outcome;
                
                delete(bar);
                
                return
                
            end
                
            f=freq(j);
            
            p=pow(i);

            rf_sg.set_rf_freq(f);
                
            rf_sg.set_rf_power(p);
            
            channel_data=obj.osc.get_channels(ch);
        
            if plt
                
                obj.osc.plot_channel_data(ax_plot,channel_data);
            
            end
            
            waitbar(glb_counter/tot_pass,bar,...
                strcat(...
                    sprintf("Freq: %.2f MHz",f/1e6),...
                    sprintf("; Power: %.2f dBm",p)));
    
            outcome(i,j).data=channel_data;
            
            outcome(i,j).freq=f;
            
            outcome(i,j).power=p;
            
        end

    end
  
    obj.outcome=outcome;
    
    delete(bar);
    
end