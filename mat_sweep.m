clc
close all
clear errV

tol = .4;
pow = -60:-40;
freq = 790e6:1e6:840e6;
errM = [];

for k = 1:length(pow)
    setPower(sg, pow(k))
    
    for j = 1:length(freq)
        setFreq(sg, freq(j))
        
        [x1, w1] = extract_channel(osc, 1);
        hold on
        [x3, w3] = extract_channel(osc, 3);
        
        err = 0;
        for i = 1:length(x3)
            if w3(i) > tol && w1(i) < tol
                err = err+1;
            elseif w3(i) < tol && w1(i) > tol
                err = err+1;
            end
            
        end
        errV(j) = err;
    end
    
    errM(:,k) = errV;
    figure(k)
    plot(freq, errV)
end