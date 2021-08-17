clear all
close all
clc

instrreset

delete(findall(0,'type','fig'))

m=InstrContr.RectMeas;

m.set_osc(NSLab.DSOX6004A)

m.set_rf_sig_gen(NSLab.TSG4104A)

m.osc.setTimeScale(5e-6)

m.osc.points=1000;

m.osc.setChannelScale([1 2],0.001);

m.osc.setBWLimit([1,2],20e6);

m.osc.activateBWLimit([1,2]);

m.osc.setAverageAcquire(64);

m.osc.setExtTrig;

tic;

outcome=m.runSEPowExperiment((700:50:900)*1e6,-30:10:-20,'plot');

t_elapsed=toc;

m.plotResult('efficiency','fun',@(x) x,'tag','P_{DC}/P_{RF}');
