
clear m

folder=sprintf('%s',...
    userpath,...
    '\OneDrive - Northeastern University\Projects\InterDigital\',...
    'EH_Efficiency\FBAR_RectEfficiency');

if exist(folder)

    oldfiles=dir(folder);

    for i=1:length(oldfiles)

        if ~oldfiles(i).isdir

            delete(strcat(oldfiles(i).folder,filesep,oldfiles(i).name));

        end

    end
    
end

delete(findall(0,'type','fig'));

m=InstrContr.RectMeas;

m.set_osc(NSLab.DSOX6004A)

m.set_rf_sig_gen(NSLab.TSG4104A)

m.osc.points=1000;

m.osc.activate_channel([1 2]);

m.osc.set_channel_scale([1 2],0.001);

m.osc.set_BW_limit([1,2],20e6);

m.osc.activate_BW_limit([1,2]);

m.osc.set_average_acquire(64);

m.osc.set_ext_trig;

m.rf_sig_gen.set_rf_gain(0);
 
r=1e6;

flag=true;

while flag
    
    answer = inputdlg('Load Resistor:','Measurement R efficiency');
    
    if ~isempty(answer)
        
        r=str2double(answer);

        m.osc.set_channel_scale([1 2],0.001);

        outcome=m.run_SE_experiment([810:1:830]*1e6,-20:2:10,[1,2],r);

        m.plot_result('efficiency');

        m.save_data(folder,string(datetime));

    else
        
        flag=false;
        
    end

end