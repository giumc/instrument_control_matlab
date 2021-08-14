clear all
close all
clc

instrreset

m=InstrContr.RectMeas;

m.set_osc(NSLab.DSOX6004A)
m.set_rf_sig_gen(NSLab.TSG4104A)

m.rf_sig_gen.start;

m.rf_sig_gen.setRfPower(-0);

m.rf_sig_gen.setRfFreq(800e6);

m.rf_sig_gen.start;

m.osc.setAutoScale;

m.osc.setTimeScale(10e-9);

m.osc.points=1000;

[t,v]=m.osc.getChannel(2);

plot(t,v)