function y=get(obj,comm,varargin)

    mapped_command=[];
    
    if startsWith(comm,'*')
        
        y=get@InstrContr.Instrument(obj,comm,varargin{:});
        
        return
        
    end
        
    for i=1:length(obj.shortcut)

        if ismember(comm,obj.shortcut{i}.valid_entries) || ...
                strcmpi(comm,obj.shortcut{i}.tag)

            mapped_command=[mapped_command;obj.shortcut{i}];
            
        end

    end
    
    switch length(mapped_command)

        case 0

            y=get@InstrContr.Instrument(obj,comm,varargin{:});

        case 1

            y=get@InstrContr.Instrument(obj,mapped_command.tag,varargin{:});

        otherwise 

            error("Entry %s is mapped to multipls commands!",comm);

    end

end
