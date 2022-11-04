function y=get(obj,comm)

    mapped_command=[];
    
    if startsWith(comm,'*')
        
        y=get@InstrContr.Instrument(obj,comm);
        
        return
        
    end
    
    for i=1:length(obj.shortcut)

        if ismember(comm,obj.shortcut{i}.valid_entries) || ...
                strcmpi(comm,obj.shortcut{i}.tag)

            mapped_command=[mapped_command;obj.shortcut{i}];
            
        end

    end
     
    if ~isempty(mapped_command)

        for i=1:length(obj.modal_commands)

            if any(matches(...
                    obj.modal_commands{i}.valid_entries,...
                    mapped_command.valid_entries))

                prefix=feval(obj.modal_commands{i}.tag,obj);

                y=get@InstrContr.Instrument(obj,...
                    strcat(prefix,mapped_command.tag));

                return

            end

        end
        
         y=get@InstrContr.Instrument(obj,...
            mapped_command.tag);
        
    else
        
        y=get@InstrContr.Instrument(obj,...
            comm);
        
    end
       
end
