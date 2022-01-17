function [x,y]=get_display_data(obj)

    x=obj.get(':calc1:sel:data:xaxis?');
    
    raw_data=split(x,',');
    
    x=cellfun(@(x) str2num(x),raw_data);
    
    y_raw=obj.get(':calc1:sel:data:fdata?');
    
    raw_data=split(y_raw,',');
    
    y_raw=cellfun(@(x) str2num(x),raw_data);
    
    j=1;

    for i=1:2:length(y_raw)

        y(j)=y_raw(i)+1i*y_raw(i+1);

        j=j+1;

    end
    
end