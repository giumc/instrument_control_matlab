function s=map_allowed_values(entries,tag)

    extra_terms={};

    entries=[entries,extra_terms];

    s=struct();
    
    s.valid_entries=entries;
    
    s.tag=tag;

end