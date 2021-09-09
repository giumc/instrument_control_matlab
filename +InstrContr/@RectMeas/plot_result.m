function fig=plot_result(obj,field,varargin)

    if isa(field,'char')
        
        field=string(field);
        
    end
    
    i_fun=InstrContr.Tools.check_if_string_is_present(varargin,'fun');
       
    i_tag=InstrContr.Tools.check_if_string_is_present(varargin,'tag');
    
    if i_fun
        
        fun=varargin{i_fun+1};
        
    else
        
        fun=@(x) x;
        
    end
    
    if i_tag
        
        tag=varargin{i_tag+1};
        
    else
        
        tag=field;
        
    end
       
    data=obj.outcome;
    
    fig=gcf;
    
    if isempty(data)
        
        warning("No data computed...");
        
        close (fig)
        
        return 
        
    end
    
    delete(fig.Children);
    
%     dataDim=size(data);
%     
%     for i=1:numel(data)
%         
%         [x,y]=ind2sub(dataDim,i);
%         
%         X(x,y)=data(i).freq/1e6;
%         
%         Y(x,y)=data(i).power;
%         
%         Z(x,y)=fun(data(i).data.(field));
%     
%     end
%     
    f=[data(:).freq]./1e6;   
    
    p=[data(:).power];
    
    d=[data(:)];
    
    d=arrayfun(@(i) fun(d(i).(field)),1:length(d));

    t=table(f.',p.',d.');
    
    t.Properties.VariableNames={'F','P','D'};
    
    p=heatmap(fig,t,'F','P','ColorVariable','D','ColorMethod','max');
    
    p.Colormap=InstrContr.Tools.brewermap([],'PuBuGn');
    
    p.Title=tag;
   
    p.XLabel='RF Frequency [MHz]';
    
    p.YLabel='RF Power [dBm]';
    
end