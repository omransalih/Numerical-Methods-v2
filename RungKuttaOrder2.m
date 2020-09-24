%% Modified Euler method (Rung-Kutta method 2-order) 

%%   The Rung-Kutta 2-order method is implemented to solve the initial value problem (Given h = 0.1)
        % y' = 2 - e^(-4x) - 2 y , y(0) = 1

clc
% Approx Code
f= @(x,y) (2 - exp(-4*x) - 2*y); % 
h=0.1;
x_final = 5;
x=0:h:x_final;
[X, E] = ode45(f,[0:h:x_final],1);
y = zeros(1,numel(x));
y(1) = 1; %y_0
K = [];
for i =2:numel(x)
    j = i-1;
    K(j) = f(x(i-1), y(i-1));
    K(j+1) = f(x(i-1) + h, y(i-1) + h*K(j));
    y(i) = y(i-1) + (1/2)*h*(K(j) + K(j+1));
    disp([x(i) E(i) y(i)])
end

subplot(121)
plot(X,E,X,y,'--')
xlabel('x-axis')
ylabel('y-axis') 
legend('Exact solution', 'Numeric solution')
title('Graph of Rung-Kutta 2-order method')

%% %% The Rung-Kutta 2-order method is implemented to solve the initial value problem (Given h = 0.1)
            % y = - 2xy^2, y(0) =1

ff= @(x,y) (-2*x*y.^2); 
hh=0.1; 
xx_final = 0.6;
xx=0:hh:xx_final;
[XX, EE] = ode45(ff,[0:hh:xx_final],1);
Y =[]; %zeros(1,numel(x));
Y(1) = 1; %Y_0

KK = [];
for i =2:numel(xx)
    j = i-1;
    KK(j) = ff(xx(i-1), Y(i-1));
    KK(j+1) = ff(xx(i-1) + hh, Y(i-1) + hh*KK(j));
    Y(i) = Y(i-1) + (1/2)*hh*(KK(j) + KK(j+1));
    disp([XX(i) EE(i) Y(i)])
end

subplot(122)
plot(xx,EE,xx,Y,'--')
xlabel('x-axis')
ylabel('y-axis') 
legend('Exact solution', 'Numeric solution')
title('Graph of Rung-Kutta 2-order method')
