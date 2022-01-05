function plot_screen(obj)

    obj.set_auto_scale;
    
    d=obj.get_channels(1:4);
    
    fig=gcf;
    
    delete(fig.Children);
    
    ax=gca;
    
    obj.plot_channel_data(ax,d);
    
    l=legend(ax);
    
    l.Visible='on';
            
end
