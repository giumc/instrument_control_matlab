function [xaxis, waveform] = plot_channel(obj, channelN, figN)

% This function is used to extract and plot the data from the oscilloscope.
% OBJ is the interface object for the oscilloscope, CHANNELN is the channel
% number (1,2,3 or 4), and figN is the figure number used for the plot.
% XAXIS is the time axis, while WAVEFORM are the data on the Y-axis.

    channel = 'channel'+string(channelN);
    str = ':waveform:source ' + channel;
    fwrite(obj, str) % selects the desired channel as source
    fwrite(obj, 'waveform:format ascii') % the data are in ASCII format
    str = 'digitize ' + channel;
    fwrite(obj, str)
    q=query(obj, 'waveform:data?'); % queries the oscilloscope's data

    % Nbits = str2num(q(3:10)); %for some reason, the length of q does not match that value
    Nbits = length(q)-10;
    Npoints = Nbits*36/513; %the factor 36/513 was found empirically seeing that with an InputBufferSize of 513 elements, i got a q string of 36 points
    waveform = [];
    k = 11;
    for i = 1:Npoints %for cycle to extract the data from the output string
        waveform(i) = str2num(q(k:k+12));
        k = k+14;
    end
    
    xaxis = 1:Npoints;
    xaxis = xaxis*str2num(query(obj, 'waveform:xincrement?')); %x-axis vector, scaled with the  oscilloscope's x-axis increment
    
    figure(figN)
    plot(xaxis,waveform)
end
