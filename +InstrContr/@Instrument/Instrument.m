classdef Instrument < matlab.mixin.Copyable & handle
    
    properties (Access=protected, Abstract)
        
        output_buffer_size;
        
        input_buffer_size;

    end
    
    properties (Access=protected)
        
        builder char;
        
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
                        
                        obj.builder=instr_obj.RsrcName;
                        
                    end
                
                end
                
            else
                
                error("Pass a ObjectConstructorName here!")
                % TODO : handle base case by prompting list of all
                % connected instruments
               
            end

            instr_obj.OutputBufferSize=obj.output_buffer_size;
            
            instr_obj.InputBufferSize=obj.input_buffer_size;
            
            fopen(instr_obj);
           
            obj.interfObj=instr_obj;
            
        end
        
        function y=id(obj)
            y=query(obj.interfObj,'*IDN?');
        end
    end
    
end
    