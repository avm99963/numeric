function [vect_x,vect_r] = biseccio_iter(Ini,niter,f)
% 
% [vect_x,vect_r] = biseccio_iter(Ini,niter,f)

vect_x = zeros(1,niter); 
vect_r = zeros(1,niter); 
x0 = Ini(1); f0 = f(x0); 
a =  Ini(2); fa = f(a); 
if f0*fa > 0 
    error('Interval inicial inadequat')
end
for i = 1:niter
    x1 = (x0 + a)/2; 
    f1 = f(x1); 
    
    vect_x(i) = x0; 
    vect_r(i) = abs((x1-x0)/x1);
    
    if f1*f0 < 0
        a = x0; fa = f0; 
    end
    
    x0 = x1; f0 = f1; 
end