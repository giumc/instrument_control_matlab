function modulate(obj, modType, modWf, rate, depthOrDev)
    
% This function allows to modulate the carrier signal.  OBJ is the signal
% generator, MODTYPE is the modulation type, MODWF is the modulation
% waveform, RATE is the rate and DEPTHORDEV is either the modulation depth
% or deviation, according to MODTYPE.
% MODTYPE can be AM, FM and phiM.
% MODWF can be sine, square, ramp and triangle.
% This function is only valid for the TEKTRONIX instrument.

    output = [];
    if str2num(query(obj,'MODL?')) == 0
         ModOn(obj);
    end
    
    switch modType
        case 'AM'
            fwrite(obj, 'TYPE 0')
            if str2num(query(obj,'TYPE?')) == 0
                output = 'AM modulation activated';
            end
            depth = sprintf('ADEP %s', string(depthOrDev));
            fwrite(obj, depth)
            modDepth = query(obj, 'ADEP?');
            if depthOrDev == str2num(modDepth(1:end-2))
                out = sprintf('The modulation depth was set to %s percent',modDepth(1:end-2));
                
            else
                out = sprintf('The modulation depth cannot be updated. Its value remains %s percent',modDepth(1:end-2));
            end
            output = [output newline out];
            
        case 'FM'
            fwrite(obj, 'TYPE 1')
            if str2num(query(obj,'TYPE?')) == 1
                output = 'FM modulation activated';
            end
            deviation = sprintf('FDEV %s', string(depthOrDev));
            fwrite(obj, deviation)
            modDev = query(obj, 'FDEV?');
            if depthOrDev == str2num(modDev)
                out = sprintf('The modulation deviation was set to %s kHz', string(str2num(modDev)/1e3));
            else
                out = sprintf('The modulation deviation cannot be updated. Its value remains %s kHz', string(str2num(modDev)/1e3));                
            end
            output = [output newline out];
        case 'phiM'
            fwrite(obj, 'TYPE 2')
            if str2num(query(obj,'TYPE?')) == 2
                output = 'phiM modulation activated';
            end
            deviation = sprintf('PDEV %s', string(depthOrDev));
            fwrite(obj, deviation)
            modDev = query(obj, 'PDEV?');
            if depthOrDev == str2num(modDev)
                out = sprintf('The modulation deviation was set to %s degrees', modDev(1:end-2));
            else
                out = sprintf('The modulation deviation cannot be updated. Its value remains %s degrees', modDev);                
            end
            output = [output newline out];
%         case 'pulse'  %pulse has a different waveform selection
%             fwrite(obj, 'TYPE 4')
%             if str2num(query(obj,'TYPE?')) == 4
%                 sprintf('pulse modulation activated')
%             end
        otherwise
            out = sprintf('Wrong modulation type');
            output = [output newline out];
    end
    switch modWf
        case 'sine'
            fwrite(obj,'MFNC 0')
            if str2num(query(obj,'MFNC?')) == 0
                out = sprintf('Sine modulation activated');
                output = [output newline out];
            end
        case 'ramp'
            fwrite(obj,'MFNC 1')
            if str2num(query(obj,'MFNC?')) == 1
                out = sprintf('Ramp modulation activated');
                output = [output newline out];
            end
        case 'triangle'
            fwrite(obj,'MFNC 2')
            if str2num(query(obj,'MFNC?')) == 2
                out = sprintf('Triangle modulation activated');
                output = [output newline out];
            end
        case 'square'
            fwrite(obj,'MFNC 3')
            if str2num(query(obj,'MFNC?')) == 3
                out = sprintf('Square modulation activated');
                output = [output newline out];
            end
        otherwise
            out = sprintf('Wrong modulation waveform');
            output = [output newline out];
    end
    
    rate_string = sprintf('RATE %s', string(rate));
    fwrite(obj, rate_string)
    if rate == str2num(query(obj, 'RATE?'))
        out = sprintf('The rate was set to %s kHz', string(str2num(query(obj, 'RATE?'))/1e3));
    else
        out = sprintf('The rate cannot be updated. Its value remains %s kHz', string(str2num(query(obj, 'RATE?'))/1e3));
    end
    output = [output newline out];
    output
end




