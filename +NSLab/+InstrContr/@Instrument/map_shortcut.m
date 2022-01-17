function s=map_shortcut(entries,tag)

    extra_terms={};

    for i=1:length(entries)

        x=entries{i};

        extra_terms=[extra_terms,upper(x)];

        extra_terms=[extra_terms,strcat(upper(x(1)),x(2:end))];
    
        if contains(x,'_')
            
            replaced_space=strrep(x,'_',' ');
            
            extra_terms=[extra_terms,replaced_space];
            
            extra_terms=[extra_terms,upper(replaced_space)];
            
        end
        
    end

    entries=[entries,extra_terms];

    s=struct();
    
    s.valid_entries=entries;
    
    s.tag=tag;

end