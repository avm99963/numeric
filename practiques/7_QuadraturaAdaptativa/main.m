clear; close all; clc
format long;

a = 0;
b = 2;

F = @(x) (sin(exp(2*x)));
% F = @(x) x;
tol = 1e-6;

global nintervals
global xfrontier
global yfrontier
nintervals = 0;
xfrontier = [];
yfrontier = [];

I = adaptive(F, a, b, tol);

figure
hold on

x = 0:0.001:2;
y = F(x);
plot(x, y)
plot(xfrontier, yfrontier, 'o')

newyfrontier = zeros(size(yfrontier, 1)) - 1;
plot(xfrontier, newyfrontier, 'x')

display(I);
display(nintervals);

hold off