function [vect_x, vect_r, final_x] = newton_raphson(x0, niter, f, jack, tol=1e-12)

vect_x = zeros(1, niter);
vect_r = zeros(1, niter);
for i = 1:niter
    f0 = f(x0);
    del = (-jack\(f0'))'
    x1 = x0 + del
    f1 = f(x1)

    %vect_x(i) = x0;
    %vect_r(i) = norm(x1 - x0)/norm(x1);

    %if vect_r(i) <= tol
    %  final_x = x1;
    %  return
    %end

    x0 = x1;
end

final_x = x1;
