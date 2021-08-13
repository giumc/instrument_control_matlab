 function autoscale(obj)
    % Autoscales the oscilloscope
    fwrite(obj.interfObj, 'autoscale')
end