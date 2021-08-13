function [diff] = EHPsweep(obj, freq, pow, chP, chN)
%   [diff] = EHPsweep(obj, freq, pow, chP, chN)
% This functions allows to make a power sweep for the energy harvester
% (EH) testing. FREQ is the frequency of the sweep, POW is
% the power in dBm, chP and chN are the oscilloscope's channels at which
% there are the positive and negative voltages, respectively.   

    obj.osc.setTimeScale(obj.EHtimeScale)
    
    obj.tek.setFreq(freq)

    for i = 1:length(pow)
        
        obj.tek.setPower(pow(i))
        
        [xP, wP] = obj.osc.getChannel(chP);
        
        [xN, wN] = obj.osc.getChannel(chN);
        
        posV = sum(wP)/length(wP);
        
        negV = sum(wN)/length(wN);
        
        diffV = posV - negV;
        
        diff(i) = diffV;
        
    end
    
    plot(pow, diff*1e3)
    
    graphEditing('Voltage across the capacitor vs. frequency', 'Frequency, [MHz]', 'Voltage, [mV]')

end