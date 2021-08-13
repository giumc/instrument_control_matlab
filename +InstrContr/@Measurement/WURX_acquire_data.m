function output_struct=WURX_acquire_data(obj,...
    freq, pow, Nbit, Nit, freqM, chComp, varargin)

    fwrite(obj.osc.interfObj, ':TIMebase:REFerence custom')
    
    scale = Nbit/freqM/10;
    
    obj.osc.setTimeScale(scale)
    
    save_struct.freqM=freqM;
    
    global_index=0;
    
    for n=1:length(freq)
        
         obj.tek.setFreq(freq(n));

        global_index=global_index+1;
        
        save_struct.carrier=freq(n);
        
        for j = 1:length(pow)

            global_index=global_index+1;

            obj.tek.setPower(pow(j));
            
            save_struct.pow=pow(j);

            for k = 1:Nit

                global_index=global_index+1;

                points = randomWf(Nbit);

                save_struct.bit_stream=points;

                obj.setUpM(freqM, points)

                [xComp, wComp] = obj.osc.getChannel(chComp);

                output_struct(global_index)=format_osc_output(xComp,wComp,save_struct);

            end
            
        end
        
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