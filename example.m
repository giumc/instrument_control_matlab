clc
clear all
close all

IPosc = '169.254.137.99';
IPsg = '10.233.16.132';
osc = initOscilloscope(IPosc)
sg = initSigGen(IPsg)


pow = -50:4:-30;

for i = 1:5
setPower(sg, pow(i))
[xaxis, waveform] = plot_channel(osc, 3, i);
pause(1)
end