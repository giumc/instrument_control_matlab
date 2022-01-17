function data_out=channel_function_sweep(data_in,fun)

    dataDims=size(data_in);

    for i=1:numel(data_in)

        [x,y]=ind2sub(dataDims,i);

        data_out(x,y)=data_in(x,y);

        fn = cellstr(data_in(x,y).data.chN);

        for j=1:numel(fn)
            
            ch_data=getfield(data_in(i).data,fn{j});

            data_out(x,y).data.(fn{j})=fun(ch_data);

        end

    end
%   
%   To be tested: version based on data_function_sweep
%
%      data_out=InstrContr.RectMeas.data_function_sweep(...
%         data_in,@(x) data_channel(x));
%     
%     function d_o=data_channel(d)
%         
%         fn = fieldnames(d);
% 
%         for j=1:numel(fn)
%             
%             ch_data=getfield(d,fn{j});
% 
%             d_o.(fn{j})=fun(ch_data);
% 
%         end
% 
%     end

end
