function plot_channel_data(obj,ax,ch)
    
    ax.XLabel.String='Time';
    
    ax.YLabel.String='Voltage';
    
    ax.Color='none';
    
    ax.XGrid='on';
    
    ax.YGrid='on';
    
    ax.GridLineStyle='-.';
    
    delete(ax.Children);
    
    fn=cellstr(ch.chN);
    
    cols=InstrContr.Tools.brewermap(length(fn),'Dark2');
    
    for i=1:length(fn)
        
        p(i)=line(ax,ch.(fn{i}).t,ch.(fn{i}).v);
        
        p(i).DisplayName=fn{i};
        
        p(i).Color=cols(i,:);
    
    end
        
    ticks=get_channel_ticks(strrep(fn{1},'ch',''));

    ax.YAxis.TickValues=ticks;

    ax.YAxis.Limits=[ticks(1), ticks(end)];
    
    drawnow;
    
    function y=get_channel_ticks(chN)
        
        scale=obj.get_channel_scale(chN);
        
        offset=obj.get([':channel',obj.format_input(chN),':offset']);
        
        y=offset-4*scale:scale:offset+5*scale;
        
    end
   
end