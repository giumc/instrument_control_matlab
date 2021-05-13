function setTimeScale(obj, scale)
    
%sets the time per division on the oscilloscope. OBJ is the oscilloscope
%interface object and SCALE is the time per division in seconds.

    scale_str = 'timebase:scale ' + string(scale);
    fwrite(obj, scale_str)
    str = query(obj, 'timebase:scale?');
    sprintf('The time scale  was set to %s seconds', str(1:end-2))
    
end