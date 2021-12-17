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

            mapped_command=obj.map_allowed_values({},comm);

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

        otherwise 

            error("Entry %s is mapped to multipls commands!",comm);

    end

    if strcmp(mapped_command.tag,'MODE')
        
        obj.mode=varargin{1};
        
    end
    
    if strcmp(mapped_command.tag,'TRACKING')
        
        obj.tracking=varargin{1};
        
    end
    
    set@InstrContr.Instrument(obj,mapped_command.tag,varargin{:});
    
end
