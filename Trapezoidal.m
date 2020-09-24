%% Predictor Corrector Method (Euler & Trapz)

%% Example 1: : Use Trapezoidal Method  to solve the initial value 
%  problem (Given h = 0.1)
                            % y' =  exp(-4t) - y^2 + sqrt(y), y(0) = 1 
            
clc
f = @(t,y) ( exp(-4*t) - y^2 + sqrt(y)  ); 
h = 0.01; 
t_final = 5;
t = 0:h:t_final;
y = zeros(1,numel(t));
[T Y] = ode45(f,[0:h:t_final],1);
y(1) = 1; %y_0
for i = 2:numel(t)
    y(i) = y(i-1) + (h/2)*(f(t(i-1), y(i-1)) + f(t(i), y(i-1)));
    disp([t(i) y(i) Y(i) abs(y(i)- Y(i))])
end

subplot(121)
plot(T,Y, t, y,'--')
xlabel('t-axis')
ylabel('y-axis') 
legend('Exact solution','Numeric solution')
title('Graph of Trapezoidal Method')


%% Example 1: : Use Trapezoidal Method to solve the initial value 
%  problem (Given h = 0.1)
                            % y' = 2 - exp(-4t) - 2 y, y(0) = 1 

clc
f = @(t,y)(2 - exp(-4*t) - 2*y);
h = 0.01; 
t_final = 5;
t = 0:h:t_final;
y = zeros(1,numel(t));
[T Y] = ode45(f,[0:h:t_final],1);
y(1) = 1; %y_0
for i = 2:numel(t)
    y(i) = y(i-1) + (h/2)*(f(t(i-1), y(i-1)) + f(t(i), y(i-1)));
    disp([t(i) y(i) Y(i) abs(y(i)- Y(i))])
end
%F = @(t,y) (2 - exp(-4 * t) - 2*y);
subplot(122)
plot(T,Y, t, y,'--')
xlabel('t-axis')
ylabel('y-axis') 
legend('Exact solution','Numeric solution')
title('Graph of Trapezoidal Method ')
