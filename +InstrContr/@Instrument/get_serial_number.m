function y=get_serial_number(obj)

    idn=obj.get('*IDN');

    strings=split(idn,', ');

    y=strings{3};

end
