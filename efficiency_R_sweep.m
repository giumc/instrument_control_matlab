instrreset

folder='C:\Users\giuse\OneDrive - Northeastern University\Projects\InterDigital\EH_Efficiency\FBAR_rect';

delete(findall(0,'type','fig'));

m=InstrContr.RectMeas;

m.set_osc(NSLab.DSOX6004A)

m.set_rf_sig_gen(NSLab.TSG4104A)

m.osc.set_time_scale(10e-6);

m.osc.points=1000;

m.osc.activate_channel([1 2]);

m.osc.set_channel_scale([1 2],0.005);

m.osc.set_BW_limit([1,2],20e6);

m.osc.activate_BW_limit([1,2]);

m.osc.set_average_acquire(64);

m.osc.set_ext_trig;

tic;

m.rf_sig_gen.set_rf_gain(43);
%%

r=1e6;

outcome=m.run_SE_experiment(500*1e6,-20:5:0,[1,2],r);

m.plot_result('efficiency');

% save_data(folder,strcat('FBAR_Rect',string(datetime)),outcome)