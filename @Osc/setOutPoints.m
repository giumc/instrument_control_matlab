function setOutPoints(obj, Npoints)
    
    obj.Npoints = Npoints;
    setPoints = 'waveform:points ' + string(obj.Npoints);
    fwrite(obj.interfObj, setPoints) % sets the number of gathered points

end