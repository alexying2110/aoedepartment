%% Data 
[X,Y] = meshgrid(-1:0.05:1);
n = size(X,1);
for i = 1:n
    plot(X(i,:),Y(i,:), 'c.-');
    hold on;
    plot(X(:,i),Y(:,i), 'c.-');
end
x = -1:0.05:1;
y1 = -0.6*sin(3*x+pi/2)-0.35;
y2 = -0.6*sin(3*x+pi/2)+0.25;
plot(x, y1, 'r.-', 'LineWidth',2);
plot(x, y2, 'b.-', 'LineWidth',2);
hold off;

%% Optimization (Simplex)
tol  = 1e-10;
myOptions = optimset(...
    'Display', 'iter', ...
    'MaxIter', 500, ...
    'MaxFunEvals', 5000, ...
    'TolX', tol, ...
    'TolFun', tol, ...
    'TolCon', tol, ...
    'LargeScale', 'off');


%% naive approach
%  a0 + a1*x + a2*y = 0;
a0 = 1;
a1 = 1;
a2 = 1;
params = [a0 a1 a2];
%simplex
%params = fminsearch('objFunc1', params, myOptions, x, y1, y2);
disp(params);
%goal is  [-0.0630    0.0000    0.9418] or [-0.0630    0.0000    1]
%for some reason simplex insists that a2 affects objFunc1's output at all
%even though it's literally not used and checking the ouput shows that
%using .9418 vs 1 has no difference up to the 14th digit

%grad descent
grad = .02;
d = .001;
nIters = 150;
for i = 1:nIters
    disp(i);
    da0 = (objFunc1([a0 + d, a1, a2], x, y1, y2) - objFunc1([a0 - d, a1, a2], x, y1, y2)) / 2 / d;
    da1 = (objFunc1([a0, a1 + d, a2], x, y1, y2) - objFunc1([a0, a1 - d, a2], x, y1, y2)) / 2 / d;
    da2 = (objFunc1([a0, a1, a2 + d], x, y1, y2) - objFunc1([a0, a1, a2 - d], x, y1, y2)) / 2 / d;
    a0 = a0 - grad * da0;
    a1 = a1 - grad * da1;
    a2 = a2 - grad * da2;
    params = [a0, a1, a2];
    disp(params);
end
disp(params);
%close enough
%% tanh hidden layer
%
%a = -0.8333;
a = -1;
b = 1;
c = -0.5;
%c = -0.5830;
w11 = 2;
w12 = 1;
w21 = 2;
w22 = 1;
b1  = 0.0;
b2  = 0.0;

params = [a b c w11 w12 w21 w22 b1 b2];
%
params = fminunc('objFunc2', params, myOptions, X, Y, x, y1, y2);
disp(params);

%%




