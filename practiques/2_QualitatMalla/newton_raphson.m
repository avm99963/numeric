function [relerr, final_x] = newton_raphson(x0, niter, f, jack, tol)

%vect_x = zeros(1, niter);
relerr = zeros(1, niter);

for iter = 1:niter
    delta = -jack(x0) \ f(x0);

    x1 = x0 + delta;
    %vect_x(iter) = x1;
    relerr(iter) = norm(x1 - x0)/norm(x0);
    
    if relerr(iter) <= tol
        final_x = x1;
        %vect_x = vect_x(1:iter);
        relerr = relerr(1:iter);
        return
    end

    x0 = x1;
end

final_x = x1;
