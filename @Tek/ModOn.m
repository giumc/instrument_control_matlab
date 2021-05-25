function ModOn(obj)
    % Turns on the modulation
    fwrite(obj.interfObj,'MODL 1');

    if str2num(query(obj.interfObj,'MODL?')) == 1
        sprintf('Modulation enabled')
    else
        sprintf('Modulation not enabled')
    end
end