function data = get_channel(obj, channelN)

    pause (1)
    
    obj.set([':waveform:source ','chan',num2str(channelN)]);
    
    pts=obj.points;
    
    try
        
        obj.set_points(pts);
        
    catch msg
        
        warning(msg.message);
        
        pts=obj.get(':waveform:points');
        
        warning('waveform:points set to %d',pts);
        
    end
    
    obj.set(':digitize');
       
    clipped=1;

    while clipped
        
        if strcmpi(obj.get(':waveform:format'),'BYTE')

            scale=obj.get_preamble;

            if obj.get(':waveform:unsigned')==1

                fprintf(obj.interfObj,'waveform:data?');
                %binblockread has to be immediately after obj.set
                sig=binblockread(obj.interfObj,'uint8');

            else

                fprintf(obj.interfObj,'waveform:data?');

                sig=binblockread(obj.interfObj,'int8');

            end

            t=zeros(1,pts);

            v=t;

            for i=1:length(sig)

                t(i)=(i-scale.x_ref)*scale.Dx+scale.x0;

                v(i)=(sig(i)-scale.y_ref)*scale.Dy+scale.y0;

            end

            if any(sig==255) || any(sig==1)

                clipped=1;

                obj.set_channel_scale(channelN,obj.get_channel_scale(channelN)*2);
                
                warning("scaled doubled to %.3f to avoid clipping in channel %s",...
                    obj.get_channel_scale(channelN),...
                    channelN);

                obj.set(':digitize');

            else 

                clipped=0;

            end

        else
            
            error('DSOX6004A get_channel handles byte-only datatypes');

        end
        
    end

    data.t=t;
    data.v=v;

end