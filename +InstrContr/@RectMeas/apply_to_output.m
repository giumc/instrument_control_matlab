function data_out=apply_to_output(obj,fun)

    data_in=obj.outcome;
    
    dataDims=size(data_in);

    for i=1:numel(data_in)

       [x,y]=ind2sub(dataDims,i);

        data_out(x,y)=fun(data_in(i));

    end

end
