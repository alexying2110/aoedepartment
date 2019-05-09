function y = constrainedUsingNonConstrained(x, c, d, inftyFlag)
%
if inftyFlag == 1
    % x>c
    y = abs(x)+c;
elseif inftyFlag == -1  
    % x<c   
    y = -abs(x)+c;
elseif inftyFlag == 0
    %c<x<d
    range = d-c;   
    if abs(x)<range
        y = abs(x)+c;
    else
        n = floor(abs(x)/range)-1;
        if rem(n,2) == 0
            y = -(abs(x)-n*range)+2*range+c;
        else
             y = abs(x)-(n+1)*range+c;
        end
    end
end

%{
x = -16:.01:16;             
y = zeros(1,3201);
for i = 1:3201
    y(i) = constrainedUsingNonConstrained(x(i), 1, 4, 0);
end
%}
            
            
        






