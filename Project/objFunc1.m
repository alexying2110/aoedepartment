function mae = objFunc1(params, x, y1, y2)
%
a0 = params(1);
a1 = params(2);
%
n = length(y1);
%
mae = sum(((y1+y2) - 2*(a0+a1*x)).^2/n);

[X,Y] = meshgrid(-1:0.05:1);
n = size(X,1);
for i = 1:n
    plot(X(i,:),Y(i,:), 'c.-');
    hold on;
    plot(X(:,i),Y(:,i), 'c.-');
end

plot(x, y1, 'b.-');
hold on;
plot(x, y2, 'r.-');
plot(x, a0+a1*x, 'g-');

top    = ones(size(x));
bottom = a0+a1*x;                  
xAxis=[x,fliplr(x)];                
area=[bottom,fliplr(top)];  
fill(xAxis, area, [0.8 0 0.9], 'LineStyle', 'none');

bottom = -ones(size(x));
top    = a0+a1*x;                 
xAxis=[x,fliplr(x)];               
area=[bottom,fliplr(top)];  
fill(xAxis, area, [0.7 .7 .7], 'LineStyle', 'none');

alpha(0.15);

axis([-1 1 -1 1]);
axis off; 
grid on;
hold off;
