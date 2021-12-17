function scale=get_preamble(obj)
    
    raw_data=obj.get('waveform:preamble');
    
    raw_data=cellfun(@str2double,split(raw_data,','));
    
    scale.format = raw_data(1);
    
    scale.type = raw_data(2);
    
    scale.points = raw_data(3);
    
    scale.count = raw_data(4);
    
    scale.Dx = raw_data(5);
    
    scale.x0 = raw_data(6);
    
    scale.x_ref = raw_data(7);
    
    scale.Dy = raw_data(8);
    
    scale.y0 = raw_data(9);
    
    scale.y_ref = raw_data(10);
    
end