clear all
clc
instrreset
tic;

interfObj=visa('ni','USB0::0x0957::0x1780::MY56270554::INSTR');

fopen(interfObj);

for i=1:10
    
    msg=query(interfObj,'*ESR?');
     
end

time_old=toc;

fclose(interfObj);

tic;
interfObj=visadev('USB0::0x0957::0x1780::MY56270554::INSTR');

for i=1:10
    
    interfObj.writeline("*ESR?");
    msg=interfObj.readline;
    
end

time_new=toc;

time_old
time_new

