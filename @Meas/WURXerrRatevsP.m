function [errMean, errVar] = WURXerrRatevsP(obj, freq, pow, Nbit, Nit, freqM, chComp, errorType,varargin)

    obj.tek.setFreq(freq)
    
    fwrite(obj.osc.interfObj, ':TIMebase:REFerence custom')
    
    scale = Nbit/freqM/10;
    
    obj.osc.setTimeScale(scale)
    
    save_struct.carrier=freq;

    save_struct.freqM=freqM;
    
    global_index=0;
    
    for j = 1:length(pow)
    
        global_index=global_index+1;
        
        obj.tek.setPower(pow(j));

        for k = 1:Nit
    
            global_index=global_index+1;
            
            points = randomWf(Nbit);
            
            save_struct.bit_stream=points;
            
            obj.setUpM(freqM, points)

            [xComp, wComp] = obj.osc.getChannel(chComp);
    
            save_struct.pow=pow(j);
            
            output_struct(global_index)=format_osc_output(xComp,wComp,save_struct);
            
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
            
        end
        
        errMean(j) = sum(errV(:,j))/Nit;
        
        for w = 1:Nit
        
            errSq(w, j) = (errV(w, j)-errMean(j))^2;
        
        end
        
        errVar(j) = sqrt(sum(errSq(:,j)));
    
    end
    
    if ~isempty(varargin)
        
        if strcmp(varargin{1},'save')
            
            path=varargin{2};
            
            filename=varargin{3};
            
        end
        
        save_data(path,filename,output_struct);
        
    end
% 
%     errMeanNorm = errMean/max(errMean);
%     for i =1:length(errMeanNorm)
%         if errMeanNorm(i) == 0
%             errMeanNorm = errMeanNorm + 1e-4;
%         end
%     end
   
end