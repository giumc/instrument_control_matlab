function setBWLimit(obj, ch)

    for i = 1:length(ch)

        channel = 'channel'+ string(ch(i));

        command = channel + ':BWLimit 1';

        fwrite(obj.interfObj, command);

    end

end