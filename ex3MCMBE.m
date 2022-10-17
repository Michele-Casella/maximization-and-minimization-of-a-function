% Exercise 3

% (b)
texact = 0:0.1:5; %interval t
yexact = -1./(texact.^3+2); %function y(t) found solving ODE
figure
plot(texact, yexact)
xlabel('t')
ylabel('y(t)')

t0 = 0;
T = 5;
y0 = -1/2;

[t,y] = ode45(@ODEf, [t0,T], y0);

figure
plot (t,y) %approximation
xlabel('t')
ylabel('y(t)')
figure
plot(t, y, 'g', texact, yexact, 'b--o' )
xlabel('t')
ylabel ('y(t)')
legend ('approximated solution', 'exact solution')

% (c)
yex = -1./(t.^3+2);
error = abs(yex - y);
plot(t,error)
title(' error between approximated and exact solution')
xlabel('t')
ylabel('error')