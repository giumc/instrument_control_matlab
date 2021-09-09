function set_mod_waveform(obj,modWf)
%   set_mod_type(obj, modWf)
%   modWf can be 'sine', 'square', 'ramp' or 'triangle'.

    switch modWf

        case 'sine'
                obj.set('MFNC',0);

        case 'ramp'
                obj.set('MFNC',1);

        case 'triangle'
                obj.set('MNFC',2);

        case 'square'
                obj.set('MNFC',3);
        otherwise

            error(strcat(...
                    sprintf("Wrong Modulation wave %s",mod_type),...
                    sprintf("Allowed Values are 'sine','ramp','triangle','square'")));

    end

end