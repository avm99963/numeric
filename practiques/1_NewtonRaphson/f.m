function [fx] = f(xin)

fx = [6*xin(1) - 2*cos(xin(2)*xin(3)) - 1, 9*xin(2) + sqrt(xin(1)^2 + sin(xin(3)) + 1.06) + 0.9, 60*xin(3) + 3*e^(xin(1)*xin(2)) + 10*pi - 3];
