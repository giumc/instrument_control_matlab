classdef RectMeas < handle
    
    properties (SetAccess=protected)
        
        osc
        
        rf_sig_gen
        
    end
    
    properties (Access=protected)
       
        outcome;

    end
    
    methods
        
        fig = plotResult(obj,field,varargin)
        
        data = runDiffPowExperiment(obj,f,p,varargin)
        
        data = runSEPowExperiment(obj,f,p,varargin)
         
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
        
        data = collectData(obj, freq, pow,ch,varargin)
        
        data = calcChannel(obj,fields_in,fun,field_out)
        
        data = calcAverage(obj)
        
        data = calcAverageDifference(obj)
        
        data = calcChPower(obj,r)
        
        data = calcData(obj,field_in,fun,field_out)
        
    end
    
    methods (Access=protected,Static)
        
        out=channel_function_sweep(data_in,fun);
        
        out=data_function_sweep(data_in,fun);

        out=function_sweep(data_in,fun);
        
        plotChannelData(ax,ch);
        
    end
    
end