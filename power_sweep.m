clc
close all
clear errV

tolM = .9;
tolO = 1.5;

freq = 816e6;
pow = -40:-30;
setFreq(sg, freq)
for j = 1:length(pow)
    setPower(sg, pow(j))
    
    [x1, w1] = extract_channel(osc, 1);
    hold on
    [x3, w3] = extract_channel(osc, 3);
    
    err = 0;
    for i = 1:length(x3)
        if w3(i) > tolM && w1(i) < tolO
            err = err+1;
        elseif w3(i) < -tolM && w1(i) > tolO/3
            err = err+1;
        end
        
    end
    errV(j) = err;
end

figure(j+1)
semilogy(pow, errV)
graphEditing('Error count vs. power @816 MHz','Power [dBm]','Error count')