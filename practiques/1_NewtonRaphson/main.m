clear all;
close all;
format long;

%clf;
%fplot(f, [-1, 4])
%pause

niter = input("Nombre d\'iteracions: ");

x0 = input("(Newton) x0: ");

jack = cjacobian(x0);

[n_vect_x, n_vect_r, n_final_x] = newton_raphson(x0, niter, @f, jack);
n_vect_x(end)
n_vect_r(end)
n_final_x
