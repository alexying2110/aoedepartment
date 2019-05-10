[X,Y] = meshgrid(-1:0.025:1);
n = size(X,1);
for i = 1:n
    plot(X(i,:),Y(i,:), 'c.-');
    hold on;
    plot(X(:,i),Y(:,i), 'c.-');
end
x = -1:0.025:1;
a = 1.0; b = -0.5;
y1 = a*x.^2;
y2 = a*x.^2 + b;
plot(x, y1, 'b.-', 'LineWidth',2);
plot(x, y2, 'r.-', 'LineWidth',2);
hold off;
pause(4);
%
w11 = 2:2:10;
w12 = 2:2:10;
w21 = 2:2:10;
w22 = 2:2:10;
b1 = -0.5:0.25:0.5;
b2 = -0.5:0.25:0.5;
m1 = length(w11);
m2 = length(b1);
for i1 = 1:m2
    for i2 = 1:m2
        for j1 = 1:m1
            for j2 = 1:m1
                for j3 = 1:m1
                    for j4 = 1:m1
                        xHat = tanh(w11(j1)*X + w21(j2)*Y + b1(i1));
                        yHat = tanh(w12(j3)*X + w22(j4)*Y + b2(i2));
                        
                        for i = 1:n
                            plot(xHat(i,:),yHat(i,:), 'c.-');
                            hold on;
                            plot(xHat(:,i),yHat(:,i), 'c.-');
                        end
                        xHat1 = tanh(w11(j1)*x + w21(j2)*y1 + b1(i1));
                        yHat1 = tanh(w12(j3)*x + w22(j4)*y1 + b2(i2));
                        %
                        xHat2 = tanh(w11(j1)*x + w21(j2)*y2 + b1(i1));
                        yHat2 = tanh(w12(j3)*x + w22(j4)*y2 + b2(i2));
                        %
                        plot(xHat1, yHat1, 'b.-', 'LineWidth',2);
                        plot(xHat2, yHat2, 'r.-', 'LineWidth',2);
                        hold off;
                        pause(0.02);
                    end
                end
            end
        end
    end
end

