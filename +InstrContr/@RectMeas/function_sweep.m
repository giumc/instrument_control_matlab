function data_out=function_sweep(data_in,fun)

    dataDims=size(data_in);

    for i=1:numel(data_in)

       [x,y]=ind2sub(dataDims,i);

        data_out(x,y)=data_in(i);

        data_out(x,y).data=fun(data_in(i));

    end

end
