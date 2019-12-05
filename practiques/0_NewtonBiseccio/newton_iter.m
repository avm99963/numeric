function [vect_x, vect_r, final_x] = newton_iter(x0, niter, f, df, tol=1e-12)

vect_x = zeros(1, niter); 
vect_r = zeros(1, niter); 
for i = 1:niter
    x1 = x0 - f(x0)/df(x0);
    f1 = f(x1); 
    
    vect_x(i) = x0; 
    vect_r(i) = abs((x1 - x0)/x1);

    if vect_r(i) <= tol
      final_x = x1;
      return
    end
    
    x0 = x1;
end

final_x = x1;
