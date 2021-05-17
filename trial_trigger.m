close all
% fwrite(osc, ':TIMebase:REFerence left')

% for j=3:4
    autoscale(osc)
    delayTrigger(osc, idleTime,3)
%     pause(1)
% sprintf('ITERATION %s', string(j))
% pause(j)
fwrite(osc, 'run')
N = 10*j;
freqM = 10e3;
Nper = 2;
idleTime = freqM^-1*Nper*N;

% pause(j)
fwrite(osc, 'trigger:sweep normal')
% [points] = randomWf(N)
points = [1,1,1,-1,1,-1]

if sum(points) == length(points)
    points(2) = -1;
elseif sum(points) == -length(points)
    points(2) = 1;
end

arbMod(mod, points, 'pd', freqM)
scale = length(points)/freqM/5*Nper;
% pause(j)
setTimeScale(osc, scale);
% pause(j)
% 
% if points(1)==1
%     fwrite(osc, ':TRIGger:Eburst:SLOPe positive')
% else 
%     fwrite(osc, ':TRIGger:Eburst:SLOPe negative')
% end
% 
% 
% 
% 
% % pause(j)
% fwrite(osc, 'stop')
% [xaxis, waveform] = extract_channel(osc, 3, 1, 1);
% % pause(j)
% % figure(j)
% plot(xaxis, waveform)  
% % pause(10)
% % end