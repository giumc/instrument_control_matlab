function delayTrigger(obj, idleTime, channelN)

    %This function allows to set the trigger in EBURST mode, so only the first
    %rising or falling edge of the first pulse will trigger the oscilloscope.
    %OBJ is the oscilloscope interface object, idleTime is the idle time
    %in which the trigger is disabled and channelN is the channel number. For
    %optimal operation, the idleTime should be set to the modulated waveform
    %period times the number of periods you want to be shown on the
    %oscilloscope
    
    fwrite(obj.interfObj, 'trigger:mode eburst')
    
    channel = 'trigger:eburst:SOURCE CHANNEL' + string(channelN);
    
    fwrite(obj.interfObj, channel)
    
    idle = 'trigger:eburst:idle ' + string(idleTime);
    
    fwrite(obj.interfObj, idle)
    
    mode = query(obj.interfObj, 'trigger:mode?');
    
    idle_str = query(obj.interfObj, 'trigger:eburst:idle?');
    
    sprintf('The trigger mode was set to %s. The idle time was set to %s s.', mode(1:end-1), idle_str(1:end-1))

end