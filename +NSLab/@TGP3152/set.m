function set(obj,comm,varargin)

    mapped_command=[];
    
    if startsWith(comm,'*')
        
        set@InstrContr.Instrument(obj,comm,varargin{:});
        
        return
        
    end
        
    for i=1:length(obj.maps)

        if ismember(comm,obj.maps{i}.valid_entries) || ...
                strcmpi(comm,obj.maps{i}.tag)

            mapped_command=[mapped_command;obj.maps{i}];
            
        end

    end
    
    switch length(mapped_command)

        case 0

            error("Entry %s is mapped to no command!",comm);

        case 1

            set@InstrContr.Instrument(obj,mapped_command.tag,varargin{:});

        otherwise 

            error("Entry %s is mapped to multipls commands!",comm);

    end

    
end
