function oscilloscope = initOscilloscope(IP)

%Initializes the oscilloscope. IP is the IP address of the tool.
    
    constructor = ['TCPIP0::', IP, '::inst0::INSTR'];
    oscilloscope = visa('keysight', constructor);
    oscilloscope.InputBufferSize=100000000; %very high input buffer size to be able to collect more data
    fopen(oscilloscope)
    name = query(oscilloscope, '*IDN?');
    sprintf('Connection to %s', name(1:end-2))
end