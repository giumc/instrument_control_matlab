function [errMean,errVar]=WURX_calc_error(xComp,)

        err = 0;

        for i = 1:Nbit

            analogBit = wComp(xComp>=(1/freqM*(i-1)) & xComp<=(1/freqM*(i)));

            if points(i)==1 && sum(analogBit)/length(analogBit)<1

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
        
        
        errMean(j) = sum(errV(:,j))/Nit;

        for w = 1:Nit

            errSq(w, j) = (errV(w, j)-errMean(j))^2;

        end

        errVar(j) = sqrt(sum(errSq(:,j)));

    end
    
end