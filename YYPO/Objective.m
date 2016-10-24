function [fit] = Objective(x,range)
    
    %%Conerting to original values;
    [size1,~] = size(range);
    for i=1:size1
        x(i) = x(i) * (range(i,2) - range(i,1)) + range(i,1);
    end
    
    %fit = 1*x(1)^3 - 2 *x(1)^2 - 4 * x(1) + 10 ; %+ 2 * x(2)^2;
    fit = -(3 * x(1)^2 - 12 * x(1) + 2 * x(2)^2  + 16*x(2) -10);
end
