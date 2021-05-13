function ModOff(obj)
% Stops the carrier modulation
    fwrite(obj,'MODL 0');
    
    if str2num(query(obj,'MODL?')) == 0
        sprintf('Modulation disabled')
    else
        sprintf('Modulation not disabled')
end