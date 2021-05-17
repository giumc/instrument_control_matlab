function arbMod(obj, points, name, freqMod)
    
%This function allows to create an arbitrary modulation function with the
%Agilent 33220A tool. The inputs are OBJ, the instrument interface object,
%POINTS, which is a vector on N elements which are +1 or -1, NAME is the
%custom waveform name and freqMod is the desired modulation frequency. This
%parameter is important since allows to set the symbol rate

    freq = freqMod/length(points);
    frequency = 'frequency ' + string(freq)
    fwrite(obj, frequency)
    voltage = 2;
    fwrite(obj, 'voltage 2')
    
    stringV = ' ';
    for i = 1:length(points)
        stringV = stringV+string(points(i));
        if i < length(points)
            stringV = stringV+', ';
        end
    end
    command = 'data volatile, '+stringV;
    fwrite(obj, command)
    name_str = ['data:copy ', name];
    fwrite(obj, name_str)
    select = ['function:user ', name];
    fwrite(obj, select)
    fwrite(obj, 'func:shape user')
end
