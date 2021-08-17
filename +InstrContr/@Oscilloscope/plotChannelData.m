function plotChannelData(obj,ax,ch)
    
    ax.XLabel.String='Time';
    
    ax.YLabel.String='Voltage';
    
    delete(ax.Children);
    
    fn=cellstr(ch.chN);
    
    cols=InstrContr.Tools.brewermap(length(fn),'BuGn');
    
    for i=1:length(fn)
        
        p(i)=line(ax,ch.(fn{i}).t,ch.(fn{i}).v);
        
        p(i).DisplayName=fn{i};
        
        p(i).Color=cols(i,:);
    
    end
        
    ticks=getChannelTicks(strrep(fn{1},'ch',''));

    ax.YAxis.TickValues=ticks;

    ax.YAxis.Limits=[ticks(1), ticks(end)];
    
    drawnow;
    
    function y=getChannelTicks(chN)
        
        scale=obj.getChannelScale(chN);
        
        offset=obj.get([':channel',obj.format_input(chN),':offset']);
        
        y=offset-4*scale:scale:offset+5*scale;
        
    end
   
end