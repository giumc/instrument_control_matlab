function setTrigger(obj, tSweep, triggerLevel, channelN)
    %Allows to set the trigger on the oscilloscope. OBJ is the oscilloscope
    %interface object, TSWEEP is the sweep type (normal or auto), TRIGGERLEVEL is the trigger value in volts and CHANNELN
    %is the channel number used for the triggering signal.

    trigsweep = ['trigger:sweep ', tSweep];
    fwrite(obj.interfObj, trigsweep)
    trigger = 'trigger:level '+ string(triggerLevel);
    fwrite(obj.interfObj, trigger)
    channel = 'trigger:SOURCE CHANNEL' + string(channelN);
    fwrite(obj.interfObj, channel)
    tl = query(obj.interfObj, 'trigger:level?');
    ch = query(obj.interfObj, 'trigger:source?');
    ts = query(obj.interfObj, 'trigger:sweep?');
    if str2num(tl) == triggerLevel
        sprintf('The trigger sweep is %s. The trigger level was set to %s V. The triggering input is on %s', ts(1:end-2), tl(1:end-2), ch(1:end-1))
    else
        sprintf('The selected trigger level cannot be chosen. Its value remains %s V', tl)
    end

end