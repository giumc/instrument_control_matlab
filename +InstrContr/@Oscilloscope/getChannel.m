function data = getChannel(obj, channelN)

    % This function is used to extract and plot the data from the oscilloscope.
    % OBJ is the interface object for the oscilloscope, CHANNELN is the channel
    % number (1,2,3 or 4), and figN is the figure number used for the plot.
    % XAXIS is the time axis, while WAVEFORM are the data on the Y-axis.
   
    obj.set(':waveform:source',['chan',num2str(channelN)]);
    
    pts=obj.points;
    
    try
        
        obj.setPoints(pts);
        
    catch msg
        
        warning(msg.message);
        
        pts=obj.get(':waveform:points');
        
        warning('waveform:points set to %d ',pts);
        
    end
    
    obj.set(':digitize');
       
    clipped=1;

    while clipped
        
        if strcmpi(obj.get(':waveform:format'),sprintf('BYTE\n'))

            scale=obj.getPreamble;

            if obj.get(':waveform:unsigned')==1

                obj.set(':waveform:data?');
                %binblockread has to be immediately after obj.set
                [sig,count,msg]=binblockread(obj.interfObj,'uint8');

            else

                obj.set(':waveform:data?');

                [sig,count,msg]=binblockread(obj.interfObj,'int8');

            end

            t=zeros(1,pts);

            v=t;

            for i=1:length(sig)

                t(i)=(i-scale.x_ref)*scale.Dx+scale.x0;

                v(i)=(sig(i)-scale.y_ref)*scale.Dy+scale.y0;

            end

            if any(sig==255) || any(sig==1)

                clipped=1;

                obj.setChannelScale(channelN,obj.getChannelScale(channelN)*2);
                
                warning("scaled doubled to %.3f to avoid clipping in channel %s",...
                    obj.getChannelScale(channelN),...
                    channelN);

                obj.set(':digitize');

            else 

                clipped=0;

            end

        end

    end

    data.t=t;
    data.v=v;

end