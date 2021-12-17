clear all
clc
ver -support

tic;

interfObj=visa('ni','USB0::0x0957::0x1780::MY56270554::INSTR');

fopen(interfObj);

for i=1:10
    
    fprintf(interfObj,'*ESR?');
    ~=f
