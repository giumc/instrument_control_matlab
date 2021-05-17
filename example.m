clc
clear all
close all

IPosc = '169.254.188.65';
IPsg = '10.233.16.132';
IPmod = '169.254.2.20';
osc = initOscilloscope(IPosc)
sg = initSigGen(IPsg)
mod = initSigGen(IPmod)

pow = -50:4:-30;

for i = 1:5
setPower(sg, pow(i))
[xaxis, waveform] = plot_channel(osc, 3, i);
pause(1)
end