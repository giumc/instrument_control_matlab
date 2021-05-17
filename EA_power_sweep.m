clc
close all

freq = 800e6:5e6:840e6;
pow = -30;
setPower(sg, pow)

for j = 1:length(freq)
    
    setFreq(sg, freq(j))
    tic
    [x1, w1] = extract_channel_2(osc, 2, 1);
    [x1, w2] = extract_channel_2(osc, 1, 1);
    toc
    posV = sum(w1)/length(w1);
    negV = sum(w2)/length(w2);
    diffV = posV - negV;
    diff(j) = diffV;
end

plot(freq, diff)
graphEditing('Voltage across the capacitor @-30 dBm vs. frequency, MEMS', 'Frequency, {\itf} [MHz]', 'Voltage, {\itV} [mV]')