classdef RectMeas < handle
    
    properties (SetAccess=protected)
        
        osc
        
        rf_sig_gen
        
    end
    
    properties (Access=protected)
       
        outcome;

    end
    
    methods
        
        fig = plot_result(obj,field,varargin)
      
        data = run_SE_experiment(obj,f,p,c,r,varargin)
        
        data = run_Diff_experiment(obj,f,p,c,r,varargin)
         
    end
   
    methods %Constructors / Destructors
        
        function delete(obj)
            
            fclose(obj.osc.interfObj);
            
            fclose(obj.rf_sig_gen.interfObj);
            
        end
        
    end
    
    methods  % One liners

        function set_osc(obj,instr)
            
            obj.osc=instr;
            
        end
        
        function set_rf_sig_gen(obj,instr)
           
            obj.rf_sig_gen=instr;
            
        end
        
    end
    
    methods (Access=protected)
        
        data = collect_data(obj, freq, pow,ch,varargin)
        
        data = calc_channel(obj,fields_in,fun,field_out)
        
        data = calc_average(obj)
        
        data = calc_average_difference(obj)
        
        data = calc_ch_power(obj,r)
        
        data = calc_data(obj,field_in,fun,field_out)

        out=apply_to_output(obj,fun);    
        
    end
    
    methods (Access=protected,Static)

        
        plot_channel_data(ax,ch);
       
        function y=dbm2w(pow)
            
            y= 10^(pow/10)*1e-3;
            
        end
    end
    
end