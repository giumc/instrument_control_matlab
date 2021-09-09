instrreset

folder='C:\Users\giuse\OneDrive - Northeastern University\Projects\InterDigital\EH_Efficiency\FBAR_rect';

delete(findall(0,'type','fig'));

m=InstrContr.RectMeas;

m.set_osc(NSLab.DSOX6004A)

m.set_rf_sig_gen(NSLab.TSG4104A)

m.osc.setTimeScale(10e-6);

m.osc.points=1000;

m.osc.activateChannel([1 2]);

m.osc.setChannelScale([1 2],0.005);

m.osc.setBWLimit([1,2],20e6);

m.osc.activateBWLimit([1,2]);

m.osc.setAverageAcquire(64);

m.osc.setExtTrig;

tic;

m.rf_sig_gen.setRfGain(43);
%%

r=1e6;

outcome=m.runSEExperiment(500*1e6,[-20:5:0],[1,2],r);

m.plotResult('efficiency');

% save_data(folder,strcat('FBAR_Rect',string(datetime)),outcome)