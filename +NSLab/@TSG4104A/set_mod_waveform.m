function set_mod_waveform(obj,mod_wf)
%   set_mod_type(obj, mod_wf)
%   mod_wf can be 'sine', 'square', 'ramp' or 'triangle'.

    switch mod_wf

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