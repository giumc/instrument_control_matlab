function [f,s]=one_port_measurement(obj)

    obj.start_single_measurement();
    
    [f,s11]=obj.get_sparam(1,1);
    
    s.s11=s11;
    
end