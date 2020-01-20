clear all
f = @(x) abs(0.5*(x+1)^2+0.5);

x = [];
y = [];
z = [];

x = -5:0.1:5;
y = -5:0.1:5;
z = zeros(length(x));
for i = 1:length(x)
    for j = 1:length(y)
        z(i, j) = f(x(i) + y(j)*1i);
    end
end

contourf(x, y, z, [0 1]);