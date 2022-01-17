function [f,s]=two_port_measurement(obj)

    obj.start_single_measurement();
    
    [f,s11]=obj.get_sparam(1,1);
    
    [~,s12]=obj.get_sparam(1,2);
    
    [~,s21]=obj.get_sparam(2,1);
    
    [~,s22]=obj.get_sparam(2,2);
    
    s.s11=s11;
    s.s12=s12;
    s.s21=s21;
    s.s22=s22;
    
end