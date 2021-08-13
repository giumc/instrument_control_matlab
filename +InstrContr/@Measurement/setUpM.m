function setUpM(obj, freqM, points)

% This function is used to set up the measurement of the wake-up receiver.
% FREQM is the modulation frequency, POINTS is a vector of +1 and -1 used
% to generate the modulating waveform, NPERIODS is the number of periods of
% the modulating waveform to be shown, TRCHANNELN is the channel used to
% trigger the oscilloscope, MODNAME is the name of the custom waveform used
% to modulate the carrier, osc and mod are the oscilloscope and agilent waveform 
% interface objects.

    fwrite(obj.osc.interfObj, 'run')

    pause(.5)
    obj.mod.arbMod(points, 'modulation', freqM)
    pause(.5)
    fwrite(obj.osc.interfObj, 'stop')
    
end