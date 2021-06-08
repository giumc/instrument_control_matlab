function struct_data=format_osc_output(t,x,info)

    struct_data.time=t;
    struct_data.voltage=x;
    struct_data.power=info.pow;
    struct_data.carrier=info.carrier;
    struct_data.freqM=info.freqM;
    struct_data.bit_stream=info.bit_stream;
 
end