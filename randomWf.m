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
    fprintf(strcat("Random sequence:",num2str(points),"\n"))
end
        