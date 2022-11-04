classdef E3631A < InstrContr.PowerSupply 
    
    properties (Access=protected)

        input_buffer_size = 2^21;

        output_buffer_size = 2^11;

    end 
    

    methods 
    
        function obj=E3631A(varargin)

            obj=obj@InstrContr.PowerSupply(...
                    visa('keysight', 'GPIB1::5::INSTR'));

            pause (1);
            
            obj.reset;
            
        end
            
    end
    
    methods
       
        function set_max_curr(obj,a)
          
            obj.set('CURR',a);
    
        end

        function set_volt(obj,v)

            obj.set('VOLT',v);
            
        end
        
        function set_volt_range(obj,v)
            
            obj.set(['INST P',num2str(v),'V']);

        end
        
        function start(obj)
            
            obj.set('output:state on');
            
        end
        
        function stop(obj)
            
            obj.set('output:state off');
            
        end
        
    end
 
end
