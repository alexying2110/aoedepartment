function mae = objFunc2(params, X, Y, x, y1, y2)
%
a   = params(1);
b   = params(2);
c   = params(3);
w11 = params(4);
w12 = params(5);
w21 = params(6);
w22 = params(7);
b1  = params(8);
b2  = params(9);

a = constrainedUsingNonConstrained(a, -0.8333-0.1, -0.8333+0.1, 0);
b = constrainedUsingNonConstrained(b,       1-0.1,       1+0.1, 0);
c = constrainedUsingNonConstrained(c, -0.5830-0.1, -0.5830+0.1, 0);

n = length(y1);

xHat = tanh(w11*X + w21*Y + b1);
yHat = tanh(w12*X + w22*Y + b2);
for i = 1:n
    plot(xHat(i,:),yHat(i,:), 'c.-');
    hold on;
    plot(xHat(:,i),yHat(:,i), 'c.-');
end
xHat1 = tanh(w11*x + w21*y1 + b1);
yHat1 = tanh(w12*x + w22*y1 + b2);
%
xHat2 = tanh(w11*x + w21*y2 + b1);
yHat2 = tanh(w12*x + w22*y2 + b2);
%
plot(xHat1, yHat1, 'r.-', 'LineWidth',2);
plot(xHat2, yHat2, 'b.-', 'LineWidth',2);
plot(x, (-c-a*x)/b, 'g-', 'LineWidth',2);

top    = ones(size(x));
bottom = (-c-a*x)/b;                %#create second curve
xAxis=[x,fliplr(x)];                %#create continuous x value array for plotting
area=[bottom,fliplr(top)];  
fill(xAxis, area, [0.8 0 0.9], 'LineStyle', 'none');

bottom = -ones(size(x));
top    = (-c-a*x)/b;                %#create second curve
xAxis=[x,fliplr(x)];                %#create continuous x value array for plotting
area=[bottom,fliplr(top)];  
fill(xAxis, area, [0.7 0.7 0.7], 'LineStyle', 'none');

alpha(0.15);

axis([-1 1 -1 1]);
axis off; 
grid on;
hold off;

%n = length(y1);
%
mae = 0;
%for y2 t = 1
e = +1*(a*xHat2 + b*yHat2 + c)/sqrt(a^2+b^2);
mae = mae - sum(e(e<0));

%for y1 t = -1
e = -1*(a*xHat1 + b*yHat1 + c)/sqrt(a^2+b^2);
mae = mae - sum(e(e<0));

%disp(params);   
pause(0.1);