function [xaxis, waveform] = getChannel(obj, channelN)

    % This function is used to extract and plot the data from the oscilloscope.
    % OBJ is the interface object for the oscilloscope, CHANNELN is the channel
    % number (1,2,3 or 4), and figN is the figure number used for the plot.
    % XAXIS is the time axis, while WAVEFORM are the data on the Y-axis.
    
    obj.set(':waveform:source',['CHAN',channelN])
    
    if strcmpi(obj.get(':waveform:format'),sprintf('BYTE\n'))
        
        scale=obj.getScale;
        
        fprintf(obj.interfObj,'waveform:data?');
        
        if strcmpi(obj.get(':waveform:unsigned'),sprintf('1\n'))
            
            data=binblockread(obj.interfObj,'uint8');
            
        else
            
            data=binblockread(obj.interfObj,'int8');
           
        end
        
    end
    
end