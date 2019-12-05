function I = adaptive(f, a, b, tol)
global nintervals
global xfrontier
global yfrontier

I = simpson(f, a, b);
I1 = simpson(f, a, (a+b)/2);
I2 = simpson(f, (a+b)/2, b);

E = abs(I - (I1 + I2));

if E > tol*(b-a)
    I = adaptive(f, a, (a+b)/2, tol) + adaptive(f, (a+b)/2, b, tol);
else
    nintervals = nintervals + 1;
    yfrontier = [yfrontier, f(b)];
    xfrontier = [xfrontier, b];
end