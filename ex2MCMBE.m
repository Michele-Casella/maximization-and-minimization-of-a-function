clear;
close;
clc;

%to define objective and constraint functions
[x1, x2] = meshgrid (-10:0.05:10,-10:0.05:10);
y = x1+3.*x2;
feasible1= ((x1-1).^2+x2.^2-5<=0);
feasible2= (-x1-x2.^2 <=0);
feasible = feasible1.*feasible2;
feasible (feasible ==0) = NaN;
y =y.*feasible;

%to plot function and feasible set
figure
surf (x1 ,x2 ,y);
xlabel ('x1');
ylabel ('x2');
zlabel ('F(X1, X2)');
colorbar;
figure
contour (x1, x2, y, 100);
xlim ('auto')
ylim ('auto')
xlabel ('x1');
ylabel ('x2');
colorbar;

x0 = [0,0];
%to find max
fmincon (@fmax, x0, [], [], [], [], [], [], @constr);
[xmax, cfmax] = fmincon (@fmax, x0, [], [], [], [], [], [], @constr);
%to find min
fmincon (@fmin, x0, [], [], [], [], [], [], @constr);
[xmin, cfmin] = fmincon (@fmin, x0, [], [], [], [], [], [], @constr);