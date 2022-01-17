function shutdown(obj)

    if ~(obj.tracking_mode=='OFF')
        
        obj.set_tracked_gen('OFF');
        
    end
    
    for i=1:obj.n_sig
        
        obj.apply_to_channel(i,'o','OFF');
        
    end
    
    for i=1:obj.active_sig_gen
        
        obj.active_sig_gen(i).delete;
        
    end
    
    obj.osc.delete;
    
end