function setTimeScale(obj, scale)

    %sets the time per division on the oscilloscope. OBJ is the oscilloscope
    %interface object and SCALE is the time per division in seconds.

    scale_str = 'timebase:scale ' + string(scale);
    
    fwrite(obj.interfObj, scale_str)
    
    str = query(obj.interfObj, 'timebase:scale?');
    
    disp(['The time scale  was set to ',...
            str(1:end-1),...
            ' seconds']);

end