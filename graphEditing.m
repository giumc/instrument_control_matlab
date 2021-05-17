function graphEditing(tit, xlab, ylab, fontSize)
    
    
    hold on
    grid on
    title(tit)
    xlabel(xlab)
    ylabel(ylab)
    defaultgraph()
    set(gcf, 'color', 'white') 
%     set(gca, 'FontSize', fontSize)
    
end