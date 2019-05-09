
[X,Y,Z] = ndgrid(-1:0.5:1, -1:0.5:1, -1:0.5:1);
n = size(X,1);
for i = 1:n
    for j = 1:n
        for k = 1:n
            plot3(X(i,j,k), Y(i,j,k), Z(i,j,k), 'c.-');
            hold on;
        end
    end
end
%
w11 = [-3 -0.5  0.5 3];
w12 = [-3 -0.5  0.5 3];
w21 = [-3 -0.5  0.5 3];
w22 = [-3 -0.5  0.5 3];
b1 = [-1 1.0];
b2 = [-1 1.0];
m1 = length(w11);
m2 = length(b1);

counter = 0;
for i1 = 1:m2
    for i2 = 1:m2
        for j1 = 1:m1
            for j2 = 1:m1
                for j3 = 1:m1
                    for j4 = 1:m1
                        
                        counter = counter + 1;
                        xHat = tanh(w11(j1)*X + w21(j2)*Y + b1(i1));
                        yHat = tanh(w12(j3)*X + w22(j4)*Y + b2(i2));
                        
                        for i = 1:n
                            plot(xHat(i,:),yHat(i,:), 'b-');
                            hold on;
                            plot(xHat(:,i),yHat(:,i), 'b-');
                        end
                        hold off;
                        pause(0.005);
                        %saveas(gcf,['C:\Users\Ali\Google Drive\CoursesColumbiaUniveristy\DeepLearning\classNotes\week1\figures\manifolds_', num2str(counter),'.png']);
                        
                    end
                end
            end
        end
    end
end

