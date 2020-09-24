clc
f = @(x,y) (cos(x^2 + 3));
h = 0.001;
x_final = 4 * pi;
x=pi/3:h:x_final;
[X, E] = ode45(f,[pi/3:h:x_final],2.5);
y = zeros(1,numel(x));
y(1) = 2.5; %y_0
K = [];

for i =2:numel(x)
    j = i-1;
    K(j) = f(x(i-1), y(i-1));
    K(j+1) = f(x(i-1) + h, y(i-1) + h*K(j));
    y(i) = y(i-1) + (1/2)*h*(K(j) + K(j+1));
    disp([x(i) E(i) y(i)])
end
subplot(121)
plot(x,E,x,y,'--')
xlabel('x-axis')
ylabel('y-axis') 
legend('Exact solution', 'Numeric solution')
title('Graph of Modified Euler Method 2nd order')

for i =1:numel(x)
    K(i) = f(x(i), y(i));
    K(i+1) = f(x(i) + h, y(i) + h*K(i));
    y(i+1) = y(i) + (1/2)*h*(K(i) + K(i+1));
    disp([x(i) E(i) y(i) abs(E(i) - y(i))])
end
x(end + 1) = [0.5];
subplot(122)
plot(X,E,x,y)
xlabel('x-axis')
ylabel('y-axis') 
legend('Exact solution', 'Numeric solution')
title('Graph of Modified Euler Method 2nd order')