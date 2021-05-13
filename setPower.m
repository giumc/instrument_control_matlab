function setPower(obj, pow)
% It allows to set the carrier power level. OBJ is the signal generator,
% while POW is thepower level in dBm
%This function is valid only for the TEKTRONIX instrument

    power = sprintf('AMPR %s', string(pow));
    fwrite(obj, power);
    value = query(obj,'AMPR?'); %self-check
    sprintf('Power set to %s dBm', value(1:end-2))
end