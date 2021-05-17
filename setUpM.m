function [xaxis, waveform] = setUpM(freqM, points, Nperiods, trChannelN, modName, osc, mod)

% This function is used to set up the measurement of the wake-up receiver.
% FREQM is the modulation frequency, POINTS is a vector of +1 and -1 used
% to generate the modulating waveform, NPERIODS is the number of periods of
% the modulating waveform to be shown, TRCHANNELN is the channel used to
% trigger the oscilloscope, MODNAME is the name of the custom waveform used
% to modulate the carrier, osc and mod are the oscilloscope and agilent waveform 
% interface objects.

    N = length(points);

    idleTime = freqM^-1*Nperiods*N;
    autoscale(osc)
    pause(5)

    fwrite(osc, 'trigger:sweep normal')
    delayTrigger(osc, idleTime,trChannelN)
    pause(5)
    scale = length(points)/freqM/5*Nperiods;
    setTimeScale(osc, scale);

    pause(10)
    arbMod(mod, points, modName, freqM)

    pause(20)

    fwrite(osc, 'stop')
    [xaxis, waveform] = extract_channel_2(osc, 1, 1, 1);

end