function [points] = randomWf(N)
    
%Generates a random vector of N elements which are either +1 or -1.
    points = [];
    for i =1:N
        ran = round(rand);
        if ran == 1
            points(i) = 1;
        else 
            points(i) = -1;
        end
        
    end
    
    for i=1:length(points)
        
        if points(i)==-1
            
            point_print(i)=0;
            
        else
            point_print(i)=1;
            
        end

    end
    
    fprintf(strcat("Random sequence:",num2str(point_print),"\n"))
end
        