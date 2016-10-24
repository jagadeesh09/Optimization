clc;
clear all;
close all;
range = [-5 3;-8 -2]
%function [P1,val1] = YYPO(
% Yang Yin Pair Optimization Algorithm %
tic
D = 2
% Initializing two points %
P1 = rand(1,D);
P2 = rand(1,D);
s = @swap
f = @Objective
val1 = f(P1,range);
val2  = f(P2,range);

if(val1 < val2)
    [P1,P2] = s(P1,P2);
    [val1,val2] = s(val1,val2);
end
% user defined parameters %
Imin = 40
Imax = 50
alpha = 1.75

% setting radii to 0.5 %
delta1 = 0.5;
delta2 = 0.5;

I = randi([Imin,Imax],1,1);
Archive = zeros(2*I,D);
fitness = zeros(1,2*I);
val1 = f(P1,range);
val2 = f(P2,range);
i = 1;
temp = val1;
condition = 1;
mycount = 0;
while(condition)
   
    if(val1 < val2)
        [P1,P2] = s(P1,P2);
        [val1,val2] = s(val1,val2);
        [delta1,delta2] = s(delta1,delta2);
    end
    %i = i + 1;
    Archive(i,:) = P1;
    Archive(I+i,:) = P2;
    fitness(1,i) = val1;
    fitness(1,I+i) = val2;
    i = i + 1;
    %temp = val1;
    [P1,val1] = Splitting(P1,delta1,D,range);
    [P2,val2] = Splitting(P2,delta2,D,range);
    P1;
    val1;
    P2;
    val2;
    if( i == I)
        [fitness,index] = sort(fitness);
        counter = 0;
        if(fitness(2*I) > val1)
            [P1,new_point] = s(P1,Archive(index(2*I),:));
            [val1,new_value] = s(val1,fitness(1,2*I));
            counter =1 ;
        end
        if(counter == 1)
            if(new_value > val2)
                [P2,~] = s(P2,new_point);
                [val2,~] = s(val2,new_value);
            end
            if(fitness(2*I-1) > val2)
                [P2, ~] = s(P1,Archive(index(2*I-1),:));
                [val2, ~] = s(val2,fitness(1,2*I-1));
            end
        end
        if(counter == 0)
            if(fitness(2*I) > val2)
                [P2, ~] = s(P1,Archive(index(2*I),:));
                [val2, ~] = s(val2,fitness(1,2*I));
            end
        end
        delta1 = delta1 - (delta1/alpha);
        delta2 = delta2 + (delta2/alpha);
        I = randi([Imin,Imax],1,1);
        Archive = zeros(2*I,D);
        i = 1;
        if(delta2 > 0.75)
            delta2 = 0.75;
        end 
        fcuk = (val1 - temp);
        Archive = zeros(2*I,D);
        fitness = zeros(1,2*I);
        condition = (abs(val1 - temp)) > 0.000000000004;
        mycount = mycount +1;
        temp = val1;
    end
    
    
end
        
[size1,~] = size(range);
    
        P1(1) = P1(1) * (range(1,2) - range(1,1)) + range(1,1);
        P1(2) = P1(2) * (range(2,2) - range(2,1)) + range(2,1);
          
        toc;
    
        




