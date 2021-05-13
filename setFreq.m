function setFreq(obj, freq)
% It allows to set the carrier frequency. OBJ is the signal generator,
% while FREQ is the frequency in Hz.
%This function is valid only for the TEKTRONIX instrument

    frequency = sprintf('FREQ %s', string(freq));
    fwrite(obj, frequency);
    value = query(obj,'FREQ?'); %self-check
    sprintf('Frequency set to %s MHz', string(str2num(value)/1e6))
end