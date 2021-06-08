clc
close all

% EH FREQ

freq = 700e6:.2e6:900e6;
pow = 0;
ch = [1,2];

diff=m.DCFSweep(freq,pow,ch,@(x) x(ch(1))-x(ch(2)));
% 
% figure(1)
% plot(freq/1e6, diff*1e3)
% graphEditing('Voltage across the capacitor vs. Frequency', 'Frequency, [MHz]', 'DC voltage, [mV]')


% EH POWER

freq = 820e6;
pow = -70:0;
ch = [1,2];

diff=m.DCPSweep(freq,pow,ch,@(x) x(ch(1))-x(ch(2)));



% WURX FREQUENCY SWEEP

freq = 790e6:.3e6:840e6;
pow = -27;
Nbit = 16;
Nit = 25;
freqM = 1e3;
chComp = 1;
errorType = 'packet';
[errMean, errVar] = m.WURXerrRatevsF(freq, pow, Nbit, Nit, freqM, chComp, errorType)

figure(3)
plot(freq/1e6, errMean);
graphEditing('Error rate vs. Frequency', 'Frequency, [MHz]', 'Packet error rate')

freq = 790e6:.3e6:840e6;
pow = -27;
Nbit = 16;
Nit = 25;
freqM = 1e3;
chComp = 1;
errorType = 'bit';
[errMean2, errVar2] = m.WURXerrRatevsF(freq, pow, Nbit, Nit, freqM, chComp, errorType)

figure(4)
plot(freq/1e6, errMean2);
graphEditing('Error rate vs. Frequency', 'Frequency, [MHz]', 'Bit error rate')


% POWER SWEEP @ 820 MHz

freq = 820e6;
pow = -70:1:0;
Nbit = 16;
Nit = 25;
freqM = 1e3;
chComp = 1;
errorType = 'packet';
[errMean3, errVar3] = m.WURXerrRatevsP(freq, pow, Nbit, Nit, freqM, chComp, errorType)

figure(5)
plot(pow, errMean3);
graphEditing('Error rate vs. Power', 'Frequency, [MHz]', 'Packet error rate')

freq = 820e6;
pow = -70:1:0;
Nbit = 16;
Nit = 25;
freqM = 1e3;
chComp = 1;
errorType = 'bit';
[errMean4, errVar4] = m.WURXerrRatevsP(freq, pow, Nbit, Nit, freqM, chComp, errorType)

figure(6)
plot(pow, errMean4);
graphEditing('Error rate vs. Power', 'Frequency, [MHz]', 'Bit error rate')


% POWER SWEEP @ 800 MHz

freq = 800e6;
pow = -70:1:0;
Nbit = 16;
Nit = 25;
freqM = 1e3;
chComp = 1;
errorType = 'packet';
[errMean5, errVar5] = m.WURXerrRatevsP(freq, pow, Nbit, Nit, freqM, chComp, errorType)

figure(7)
plot(pow, errMean5);
graphEditing('Error rate vs. Power', 'Frequency, [MHz]', 'Packet error rate')

freq = 800e6;
pow = -70:1:0;
Nbit = 16;
Nit = 25;
freqM = 1e3;
chComp = 1;
errorType = 'bit';
[errMean6, errVar6] = m.WURXerrRatevsP(freq, pow, Nbit, Nit, freqM, chComp, errorType)

figure(8)
plot(pow, errMean6);
graphEditing('Error rate vs. Power', 'Frequency, [MHz]', 'Bit error rate')


% POWER SWEEP @ 840 MHz

freq = 840e6;
pow = -70:1:0;
Nbit = 16;
Nit = 25;
freqM = 1e3;
chComp = 1;
errorType = 'packet';
[errMean7, errVar7] = m.WURXerrRatevsP(freq, pow, Nbit, Nit, freqM, chComp, errorType)

figure(9)
plot(pow, errMean7);
graphEditing('Error rate vs. Power', 'Frequency, [MHz]', 'Packet error rate')

freq = 840e6;
pow = -70:1:0;
Nbit = 16;
Nit = 25;
freqM = 1e3;
chComp = 1;
errorType = 'bit';
[errMean8, errVar8] = m.WURXerrRatevsP(freq, pow, Nbit, Nit, freqM, chComp, errorType)

figure(10)
plot(pow, errMean8);
graphEditing('Error rate vs. Power', 'Frequency, [MHz]', 'Bit error rate')

