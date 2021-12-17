function plot_screen(obj)
    
    chN=[];
        
    for i=1:4
        
        isactive=obj.get([':channel',num2str(i),':display?']);
        
        if isactive
            
            chN=[chN,i];
            
        end
        
    end
    
    d=obj.get_channels(chN);
    
    fig=gcf;
    
    delete(fig.Children);
    
    ax=gca;
    
    obj.plot_channel_data(ax,d);
            
end
