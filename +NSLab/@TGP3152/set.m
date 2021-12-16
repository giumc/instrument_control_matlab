function set(obj,comm,varargin)

    mapped_command=[];
    
    if startsWith(comm,'*')
        
        set@InstrContr.Instrument(obj,comm,varargin{:});
        
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

            error("Entry %s is mapped to no command!",comm);

        case 1
            
            allowed_values=obj.allowed_values;
            
            for i=1:length(allowed_values)
                
                if strcmp(mapped_command.tag,...
                        allowed_values{i}.tag)
                    
                    if ~isempty(varargin)
                        
                        mustBeMember(varargin{1},...
                            allowed_values{i}.valid_entries);
                        
                    end
                    
                end
                
            end

            set@InstrContr.Instrument(obj,mapped_command.tag,varargin{:});

        otherwise 

            error("Entry %s is mapped to multipls commands!",comm);

    end

    
end
