clear; close all; clc

a = 0;
b = 5;

F = @(x) (exp(-x) + (1/2)*exp(-(x-4)^2));
Fphi = @(t) (((b-a)/2)*F(((b-a)*t + b + a)/2));

maxn = 14;

errNC = zeros(maxn, 1);
errGL = zeros(maxn, 1);

for i=1:14
    Ireal = exp(-a) - exp(-b) + (sqrt(pi)/4)*(erf(b-4) - erf(a-4))
    
    % Newton-Cotes
    xn = linspace(a, b, i)';
    wn = Pesos(F, xn);
    INC = Integral(F, wn, xn)
    
    % Gauss-Legendre
    [zg, wg] = QuadraturaGauss(i);
    IGL = Integral(Fphi, wg, zg)

    errNC(i) = abs(Ireal - INC);
    errGL(i) = abs(Ireal - IGL);
end

lnerrNC = log(errNC)
lnerrGL = log(errGL)

figure

hold on
plot(lnerrNC)
plot(lnerrGL)
hold off