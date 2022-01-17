function start_single_measurement(obj)
    
    obj.set(':trig:sing');
    old_timeout=obj.interfObj.Timeout;
    obj.interfObj.Timeout=100;
    obj.get('*OPC?');
    obj.interfObj.Timeout=old_timeout;

end
