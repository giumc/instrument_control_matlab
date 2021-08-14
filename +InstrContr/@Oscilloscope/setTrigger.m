function setTrigger(obj, tSweep, triggerLevel, channelN)
    %Allows to set the trigger on the oscilloscope. OBJ is the oscilloscope
    %interface object, TSWEEP is the sweep type (normal or auto), TRIGGERLEVEL is the trigger value in volts and CHANNELN
    %is the channel number used for the triggering signal.

    obj.set('trigger:sweep ', tSweep);
    
    obj.set('trigger:level ',triggerLevel);
    
    obj.set('trigger:SOURCE CHANNEL',channelN);

    
end