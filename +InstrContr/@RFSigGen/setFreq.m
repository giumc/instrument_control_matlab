function setFreq(obj, freq)
    % It allows to set the carrier frequency. OBJ is the signal generator,
    % while FREQ is the frequency in Hz.
    %This function is valid only for the TEKTRONIX instrument
    
    frequency = sprintf('FREQ %s', string(freq));
    fwrite(obj.interfObj, frequency);
    value = query(obj.interfObj,'FREQ?'); %self-check
    output = 'Frequency set to '+ string(str2num(value)/1e6)+ ' MHz';
    disp(output)
end