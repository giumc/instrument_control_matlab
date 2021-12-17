classdef Instrument < matlab.mixin.Copyable & handle
    
    properties (Access=protected, Abstract)
        
        output_buffer_size;
        
        input_buffer_size;

    end
    
    properties (Access=protected)
        
        builder char;
        
        timeout=3;
        
    end
    
    properties 
        
        interfObj ;
        
    end
    
    methods 
        
        function obj=Instrument(varargin)
            
            if ~isempty(varargin)
                
                if ischar(varargin{1})
                    
                    obj.builder=varargin{1};
                    
                    instr_obj=eval(obj.builder);
                    
                else
                    
                    if isobject(varargin{1})
                        
                        instr_obj=varargin{1};
                        
                        obj.builder=instr_obj.ResourceName;
                        
                    end
                
                end
                
            else
                
                error("Pass a ObjectConstructorName here!")
                % TODO : handle base case by prompting list of all
                % connected instruments
               
            end

%             instr_obj.OutputBufferSize=obj.output_buffer_size;
            
%             instr_obj.InputBufferSize=obj.input_buffer_size;
            
            
%             fopen(instr_obj);
           
            obj.interfObj=instr_obj;
            
            obj.interfObj.Timeout=obj.timeout;
            
            obj.reset;
            
        end
    
        y=get(obj,comm,varargin)
        
        set(obj,comm,varargin)
        
        check_for_errors(obj)
       
        function delete(obj)
            
            delete(obj.interfObj);
            
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
    