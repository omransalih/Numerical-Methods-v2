%% Predictor Corrector Method (Euler Methods)

%% Example 1: Use Predictor Corrector Method (Euler Methods) to solve the initial value 
%  problem (Given h = 0.1)
                            % y' =  exp(-4t) - y^2 + sqrt(y), y(0) = 1 
clc
f = @(t,y) ( exp(-4*t) - y^2 + sqrt(y) );
h = 0.1;
t_final = 3;
t = 0:h:t_final;
y = zeros(1,numel(t));
[T Y] = ode45(f,[0:h:t_final],1);
y(1) = 1; %y_0
for j = 2:numel(t)
    p(j) = y(j-1) + h*f(t(j-1), y(j-1));
    y(j) = y(j-1) + (h)*(f(t(j), p(j)));
    disp([t(j) y(j) Y(j) abs(y(j) - Y(j))])
end
%Exact Part
subplot(121)
plot(T,Y, t, y,'--')
xlabel('t-axis')
ylabel('y-axis') 
legend('Exact solution','Numeric solution')
title('Graph of Predictor Corrector Method (Euler)')

%% Example 1: Use Predictor Corrector Method (Euler Methods) to solve the initial value 
%  problem (Given h = 0.1)
                            % y' = 2 - exp(-4t) - 2 y, y(0) = 1 

clc
f = @(t,y) (2 - exp(-4*t) - 2*y);
h = 0.1;
t_final = 3;
t = 0:h:t_final;
y = zeros(1,numel(t));
[T Y] = ode45(f,[0:h:t_final],1);
y(1) = 1; %y_0
for j = 2:numel(t)
p(j) = y(j-1) + h*f(t(j-1), y(j-1));
y(j) = y(j-1) + (h)*(f(t(j), p(j)));
disp([t(j) y(j)])
end
%Exact Part

subplot(122)
plot(T,Y, t, y,'--')
xlabel('t-axis')
ylabel('y-axis') 
legend('Exact solution','Numeric solution')
title('Graph of Predictor Corrector Method (Euler)')