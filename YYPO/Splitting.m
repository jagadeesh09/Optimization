function[P,fitness] = Splitting(Point, delta, D,range)
    number = rand;
    if(number > 0.5)
        S = zeros(2* D,D);
        for i = 1:2*D
            S(i,:) = Point;
        end
        r = rand(1,2*D);
        for i = 1:D
            S(i,:) = S(i,:) + r(i) *  delta;
            S(i+D,:) = S(i+D,:) - r(i) *  delta;
        end
    else
        B = rand(2*D,D) > 0.6;
        S = zeros(2* D,D);
        for i = 1:2*D
            S(i,:) = Point;
        end
        r = rand(2*D,D);
        for i= 1:2*D
            for j=1:D
                if(B(i,j) == 1)
                    S(i,j) = S(i,j) + (r(i,j) * delta/sqrt(2));
                else
                    S(i,j) = S(i,j) - (r(i,j) * delta/sqrt(2));
                end
            end
        end
    end
    for i= 1:2*D
        for j= 1:D
            if(S(i,j) < 0 | S(i,j) > 1)
                S(i,j) = rand;
            end
        end
    end
    fit = zeros(1,2*D);
    for i = 1:2*D
        fit(i) = Objective(S(i,:),range);
    end
    
    [bestfit,index] = sort(fit);
    P = S(index(2*D),:);
    fitness = bestfit(2*D);
end
