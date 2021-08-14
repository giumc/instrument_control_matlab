function [t, v] = getChannel(obj, channelN)

    % This function is used to extract and plot the data from the oscilloscope.
    % OBJ is the interface object for the oscilloscope, CHANNELN is the channel
    % number (1,2,3 or 4), and figN is the figure number used for the plot.
    % XAXIS is the time axis, while WAVEFORM are the data on the Y-axis.
    
    obj.set(':waveform:source',['CHAN',num2str(channelN)]);
    
    obj.setPoints(obj.points);
    
    obj.set('digitize');
    
    if strcmpi(obj.get(':waveform:format'),sprintf('BYTE\n'))
        
        scale=obj.getScale;
        
        if strcmpi(obj.get(':waveform:unsigned'),sprintf('1\n'))
            
            fprintf(obj.interfObj,'waveform:data?');
        
            data=binblockread(obj.interfObj,'uint8');
            
        else
            
            fprintf(obj.interfObj,'waveform:data?');
        
            data=binblockread(obj.interfObj,'int8');
           
        end
        
        for i=1:length(data)
        
            t(i)=(i-scale.x_ref)*scale.Dx+scale.x0;

            v(i)=(data(i)-scale.y_ref)*scale.Dy+scale.y0;

        end
        
        if any(data==255) || any(data==1)
            
            warning("Reconstructed voltage is clipped!");
            
        end
        
    end
    
end