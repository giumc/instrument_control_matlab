function [errMean, errVar] = WURXerrRatevsF(obj, freq, pow, Nbit, Nit, freqM, chComp, errorType)

    obj.tek.setPower(pow)
    fwrite(obj.osc.interfObj, ':TIMebase:REFerence custom')
    scale = Nbit/freqM/10;
    obj.osc.setTimeScale(scale)

    for j = 1:length(freq)

        obj.tek.setFreq(freq(j));

        for k = 1:Nit

            points = randomWf(Nbit);
            obj.setUpM(freqM, points)

            [xComp, wComp] = obj.osc.getChannel(chComp);

            err = 0;
            for i = 1:Nbit

                analogBit = wComp(xComp>=(1/freqM*(i-1)) & xComp<=(1/freqM*(i)));
                if points(i)==1 && sum(analogBit)/length(analogBit)<0.5
                    err = err+1;
                elseif points(i)==-1 && sum(analogBit)/length(analogBit)>1
                    err = err+1;
                end
            end
            
            switch errorType
                case 'packet'
                    if sum(err) ~= 0
                        symbErr = 1;
                    else
                        symbErr = 0;
                    end
                    errV(k, j) = symbErr;
                case 'bit'
                    errV(k,j) = err;
                 
            end
            
        end
        
        errMean(j) = sum(errV(:,j))/Nit;
        for w = 1:Nit
            errSq(w, j) = (errV(w, j)-errMean(j))^2;
        end
        errVar(j) = sqrt(sum(errSq(:,j)));
    end
% 
%     errMeanNorm = errMean/max(errMean);
%     for i =1:length(errMeanNorm)
%         if errMeanNorm(i) == 0
%             errMeanNorm = errMeanNorm + 1e-4;
%         end
%     end
   
end