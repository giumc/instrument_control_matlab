clc
close all

% freq = 830e6;
% pow = -35.5;
% Nbit = 16;
% Nit = 10;
% freqM = 1e3;
% chComp = 1;
% 
% 
% figure(1)
% tic
% [errMean1, errVar1] = m.WURXerrRatevsP(freq, pow, Nbit, Nit, freqM, chComp)
% toc
% plot(pow, errMean1)



freq = 820e6;%800e6:10e6:900e6;
pow = 0;
Nbit = 8;
Nit = 10;
freqM = 1e3;
chComp = 1;


% figure(1)
tic
[errMean, errVar] = m.WURXerrRatevsF(freq, pow, Nbit, Nit, freqM, chComp)
toc
plot(freq, errMean)