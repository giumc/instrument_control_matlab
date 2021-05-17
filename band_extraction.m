clc
close all
defaultgraph

tol = .4;

freq = 500e6:10e6:1000e6;

for j = 1:length(freq)
    setFreq(sg, freq(j))
    
    [x1, w1] = plot_channel(osc, 1, j)
    hold on
    [x3, w3] = plot_channel(osc, 3, j)
    
    err = 0;
    for i = 1:length(x3)
        if w3(i) > 0 && w1(i) < tol
            err = err+1;
        elseif w3(i) < 0 && w1(i) > tol
            err = err+1;
        end
        
    end
    errV(j) = err;
end

figure(j+1)
plot(freq, errV)
graphediting('Error count vs. frequency','Frequency [MHz]','Error count')