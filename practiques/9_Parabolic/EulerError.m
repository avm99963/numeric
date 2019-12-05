function [errabs, errrel] = EulerError(f, limits, y0, m)
[tm, Xm] = Euler(f, limits, y0, m);
[t2m, X2m] = Euler(f, limits, y0, 2*m);

Xm(1:2, end);
X2m(1:2, end);
errabs = norm(Xm(1:2, end) - X2m(1:2, end));
errrel = errabs/norm(X2m(1:2, end));