clear all;
close all;
format long;

f = @(x) x.^5 - 4*x.^4 + 7*x.^3 - 21*x.^2 + 6*x + 18;
df = @(x) 5*x.^4 - 16*x.^3 + 21*x.^2 - 42*x + 6;

%clf;
%fplot(f, [-1, 4])
%pause

niter = input("Nombre d\'iteracions: ");

%Ini = [input("(Bisecció) a: "), input("(Bisecció) b: ")];
%[b_vect_x, b_vect_r] = biseccio_iter(Ini, niter, f);
%b_vect_x(end)

x0 = input("(Newton) x0: ");
[n_vect_x, n_vect_r, n_final_x] = newton_iter(x0, niter, f, df);
n_vect_x(end)
n_vect_r(end)
n_final_x
