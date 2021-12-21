function plot_channel_data(obj,ax,ch)
    
    ax.XLabel.String='Time';
    
    ax.YLabel.String='Voltage';
    
    ax.Color='none';
    
    ax.XGrid='on';
    
    ax.YGrid='on';
    
    ax.GridLineStyle='-.';
    
    delete(ax.Children);
    
    fn=cellstr(ch.chN);
    
    scale=[];
    
    for i=1:length(fn)
        
        ch_number=str2double(strrep(fn{i},'ch',''));
  
        p(i)=line(ax,...
            ch.(fn{i}).t,...
            ch.(fn{i}).v,...
            'Color',obj.channel_colors(ch_number));
      
        p(i).DisplayName=fn{i};
        
    end
        
    xlim auto
    ylim auto
    
    drawnow;

end