function delayTrigger(obj, idleTime)
    
    fwrite(obj, 'trigger:mode eburst')
    idle = 'trigger:eburst:idle ' + string(idleTime);
    fwrite(obj, idle)
    mode = query(obj, 'trigger:mode?');
    idle_str = query(obj, 'trigger:eburst:idle?');
    sprintf('The trigger mode was set to %s. The idle time was set to %s s.', mode(1:end-1), idle_str(1:end-1))
end