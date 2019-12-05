clear; close all; clc

load malla.mat;
plotMesh(X,T)

F = @(y)(calculaDistorsioMalla([reshape(y,Nint,2);X(Nint+1:end,:)],T));

y0 =  reshape(X(1:Nint,:),2*Nint,1);

tol = 1e-8; maxIter = 50;

% Completar el codi per determinar la posicio dels nodes interiors que
% minimitza la distorsio de la malla.
% Abans de fer servir el metode de Newton, cal completar la funcio
% calculaDistorsioMalla

F(y0)

residue = @(y)(numericalDerivative(F, y));
jack = @(y)(numericalHessian(F, y));

[relerr, final_y] = newton_raphson(y0, maxIter, residue, jack, tol);

display(final_y);

F(final_y)

figure
plot(log10(relerr'))

X = [reshape(final_y,Nint,2);X(Nint+1:end,:)];

X

figure
plotMesh(X,T)