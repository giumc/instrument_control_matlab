function ModOn(obj)
    fwrite(obj,'MODL 1');
    
    if str2num(query(obj,'MODL?')) == 1
        sprintf('Modulation enabled')
    else
        sprintf('Modulation not enabled')
end