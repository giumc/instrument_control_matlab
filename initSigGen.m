function sgen = initSigGen(IP)

%Initializes the signal generator. IP is the IP address of the tool.

    constructor = ['TCPIP0::', IP, '::inst0::INSTR'];
    sgen = visa('ni', constructor);
    fopen(sgen)
    name = query(sgen, '*IDN?');
    sprintf('Connection to %s', name(1:end-2))
end