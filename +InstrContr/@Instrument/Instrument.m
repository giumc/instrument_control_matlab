classdef Instrument <  handle
    
    properties (Access=protected, Abstract)
        
        output_buffer_size;
        
        input_buffer_size;

    end
    
    properties (Access=protected)
        
        builder char;
        
        timeout=1;
        
    end
    
    properties 
        
        interfObj ;
        
    end
    
    methods 
        
        function obj=Instrument(visa)

            
            if ischar(visa)

                obj.builder=visa;

                instr_obj=eval(obj.builder);

            else

                if isobject(visa)

                    instr_obj=visa;

                    obj.builder=instr_obj.RsrcName;

                end

            end
            
            fopen(instr_obj);
            
            obj.interfObj=instr_obj;
            
            obj.interfObj.Timeout=obj.timeout;
            
            obj.reset;
            
        end
    
        y=get(obj,comm,varargin)
        
        set(obj,comm,varargin)
        
        check_for_errors(obj)
       
        function delete(obj)
            
            fclose(obj.interfObj);
            
        end
        
    end
    
    methods %One liners
       
        function y=id(obj)
        
            
            y=obj.get('*IDN');
            
        end 
         
        function reset(obj)
            
            obj.set('*RST');
            
        end
        
    end
    
    methods (Static)
        
    function stream=format_input(stream)
           
            if isnumeric(stream)
                
                if isrow(stream)
                    
                    stream=stream.';
                end
                
                stream=num2str(stream);
               
            end
            
        end
        
    s=map_shortcut(valid_entries,tag);
    
    s=map_allowed_values(valid_entries,tag);
    
    y=to_binary(str,varargin);
        
    end
    
end
    