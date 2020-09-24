%% Rung-Kutta 4th Order Method 

%% Use Rung-Kutta 4th order method to solve the initial value problem (Given ? = 0.1)
            % y = - 2xy^2, y(0) =1

clc
clear all 
f= @(x,y) (-2*x*y.^2); 
h=0.1; 
x_final = 0.4;
x=0:h:x_final;
[X, E] = ode45(f,[0:h:x_final],1);
y = zeros(1,numel(x));
y(1) = 1; %y_0
K = [];
for i =2:numel(x)
    j = i-1;
    K(j)   = f(x(i-1), y(i-1));
    K(j+1) = f(x(i-1) + (1/2)* h, y(i-1) + (1/2)*h*K(j));
    K(j+2) = f(x(i-1) + (1/2)* h, y(i-1) + (1/2)*h*K(j+1));
    K(j+3) = f(x(i-1) + h, y(i-1) + h*K(j+2));
    y(i)   = y(i-1) + (1/6)*h*(K(j) + 2*K(j+1) + 2*K(j+2) +K(j+3));
    %disp([X(i) E(i) y(i) abs(E(i) - y(i))])
end
subplot(121)
plot(X,E,x,y,'--')
xlabel('t-axis')
ylabel('y-axis') 
legend('Exact solution', 'Numeric solution')
title('Graph of Rung-Kutta 4th order Method')


%% %% This code Use Rung-Kutta 4th order method to solve the initial value problem (Given ? = 0.1)
                           
                    %%% y' = 2 - e^(-4t) - 2 y , y(0) = 1 %%%%  
clc
f= @(x,y) (2 - exp(-4*x) - 2*y); 
h=0.1; 
x_final = 5;
x=0:h:x_final;
[X, E] = ode45(f,[0:h:x_final],1);
y = zeros(1,numel(x));
y(1) = 1; %y_0
K = [];
for i =2:numel(x)
    j = i-1;
    K(j)   = f(x(i-1), y(i-1));
    K(j+1) = f(x(i-1) + (1/2)* h, y(i-1) + (1/2)*h*K(j));
    K(j+2) = f(x(i-1) + (1/2)* h, y(i-1) + (1/2)*h*K(j+1));
    K(j+3) = f(x(i-1) + h, y(i-1) + h*K(j+2));
    y(i)   = y(i-1) + (1/6)*h*(K(j) + 2*K(j+1) + 2*K(j+2) +K(j+3));
    %disp([X(i) E(i) y(i) abs(E(i) - y(i))]) % Error display 
end

subplot(122)
plot(X,E,x,y,'--')
xlabel('t-axis')
ylabel('y-axis') 
legend('Exact solution', 'Numeric solution')
title('Graph of Rung-Kutta 4th order Method ')

