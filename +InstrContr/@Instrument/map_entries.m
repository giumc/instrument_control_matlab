function s=map_entries(entries,tag)

    extra_terms={};

    for i=1:length(entries)

        x=entries{i};

        extra_terms=[extra_terms,upper(x)];

        extra_terms=[extra_terms,strcat(upper(x(1)),x(2:end))];

    end

    entries=[entries,extra_terms];

    s=struct();
    
    s.valid_entries=entries;
    
    s.tag=tag;

end