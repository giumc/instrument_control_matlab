clear all
close all
clc
instrreset

m=InstrContr.RectMeas;

m.set_osc(NSLab.DSOX6004A)
m.set_rf_sig_gen(NSLab.TSG4104A)

m.osc.getChannel(2);
