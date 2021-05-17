function pillow(obj)

    while str2num(query(obj, '*OPC?'))~= 1
        pause(1)
    end
    
end