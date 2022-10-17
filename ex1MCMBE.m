clear
clc
close

%define a 2-dimensional grid to sample the plane R^2 (domain of the function):
[x1, x2] = meshgrid(-3:0.1:3, -3:0.1:3);
%domain [−100, 100] × [−100, 100] (large square) sampled with uniform step 2. 
%You obtain two matrices x1 and x2.

%objective function
ucf = 2 - (x1 + x2).^2 - (x2.^2 + x2 - x1).^2; 

figure
surf (x1, x2, ucf)
xlabel ('x1');
ylabel ('x2');
zlabel ('f(x1;x2)');
colorbar;
figure
contour (x1, x2, ucf, 200)
xlabel ('x1');
ylabel ('x2');
colorbar;

x0 = [0 , 0]; %initial guess as maximum
fminunc (@ucfmax, x0)
xmax = fminunc (@ucfmax,x0)
[xmax, fmax] = fminunc (@ucfmax, x0)

x1 = [2 , -2]; 
fminunc (@ucf, x1)
xmin = fminunc (@ucf,x1)
[xsad1, f] = fminunc (@ucf, x1)

x2 = [0.5 , -1]; 
fminunc (@ucf, x2)
xsad2 = fminunc (@ucf,x2)
[xsad2, f] = fminunc (@ucf, x2)

