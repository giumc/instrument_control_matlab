function extTrig(obj)
    % sets the trigger source as external
    fwrite(obj.interfObj, 'trigger:source ext')
end