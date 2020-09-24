% Euler Method and Modified Euler method (Rung-Kutta method 2-order) 

%% This code Use Euler’s method to solve the initial value problem (Given ? = 0.1)
        % y' = 2 - e^(-4t) - 2 y , y(0) = 1
clc
% Approx Code
f= @(t,y) (2 - exp(-4*t) - 2*y); % 
h=0.1;
t_final = 5;
t=0:h:t_final;
y = zeros(1,numel(t));
y(1) = 1; %y_0
for i =2:numel(t)
 y(i) = y(i-1) + h*f(t(i-1), y(i-1));
 %disp([t(i) y(i)])
end
% Exact solution Code
[T Y]=ode45(f,[0:h:t_final],1);

subplot(121)
plot(T,Y, t, y,'--')
xlabel('t-axis')
ylabel('y-axis') 
legend('Exact solution', 'Numeric solution')
title('Graph of Euler Method (Numeric and Exact)')

%% Use Euler’s method to solve the initial value problem (Given ? = 0.1)
            % y = - 2xy^2, y(0) =1


ff= @(x,y) (-2*x*y.^2); 
hh=0.1; 
xx_final = 0.6;
xx=0:hh:xx_final;
EE = 1./(xx.^2 + 1);
Y =[]; %zeros(1,numel(x));
Y(1) = 1; %Y_0
for i =1:numel(xx)-1
    Y(i+1) = Y(i) + hh*ff(xx(i), Y(i));
    %disp([xx(i) EE(i) Y(i) abs(EE(i)-Y(i))]);
end
subplot(122)
plot(xx,EE,xx,Y,'--')
xlabel('x-axis')
ylabel('y-axis') 
legend('Exact solution', 'Numeric solution')
title('Graph of Euler Method (Numeric and Exact)')


%%  
