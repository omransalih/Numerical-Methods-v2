%% Shooting Method 

% Example: Solve the following second ordinary differential equation problem
         %  y'' = 2y + 8x (9 - x),     y(0), y(9) = 0, h =3

format short  
clc
f1 = @(x,y,z) (z);
f2 = @(x,y,z) (2*y + 8*x*(9 - x));
h = 3; 
x = 0:h:9;
y = zeros(1, numel(x));
z = zeros(1, numel(x)); 
y(1) = 0; %y_0
z(1) = 4; %z0

ff1 = @(x1,y1,z1) (z1);
ff2 = @(x1,y1,z1) (2*y1 + 8*x1*(9 - x1));
x1 = 0:h:9;
y1 = zeros(1, numel(x1));
z1 = zeros(1, numel(x1)); 
y1(1) = 0; %y_0
z1(1) = -20.5714; %z0
for i =2:numel(x)
    y(i) = y(i-1) + h * f1(x(i-1), y(i-1), z(i-1));
    z(i) = z(i-1) + h * f2(x(i-1), y(i-1), z(i-1));
    y1(i) = y1(i-1) + h * ff1(x1(i-1), y1(i-1), z1(i-1));
    z1(i) = z1(i-1) + h * ff2(x1(i-1), y1(i-1), z1(i-1));
end
fprintf('     i     x     y     z \n')
fprintf('==========================================\n')
for i=1:numel(x)
    disp([i x(i) y(i) z(i)])
end
fprintf('     i         x1           y1        z1 \n')
fprintf('==========================================\n')
for i=1:numel(x)
    disp([i x1(i) y1(i) z1(i)])
end
plot(x,y)
p0 = z(1); 
p1 = z1(1); 
q0 = y(4);
q1 = y1(4); 
q = 0;
p = p0 + ((p1 - p0)/(q1 - q0)) * (q - q0)



