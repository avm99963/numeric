function d2S = calculaCurvaturesSplineNatural(x,y)
% Donats x i y, calcula les curvatures als punts base corresponents a l'Spline natural

%Condicions de la derivada a x0 i xend
d2S0 = 0;
d2Send = 0;

xlen = length(x);

A = 2*eye(xlen-2);

h=x(2:end)-x(1:end-1);
t=y(2:end)-y(1:end-1);

lambda = h(2:end-1)./(h(2:end-1) + h(1:end-2));
mu = h(2:end-1)./(h(3:end) + h(2:end-1));

A = A + diag(lambda, 1) + diag(mu, -1);

d = 6*(t(2:end)./h(2:end) - t(1:end-1)./h(1:end-1))./(h(2:end) + h(1:end-1));

% d(1) = d(1) + d2S0;
% d(end) = d(end) + d2Send;

d2S = [d2S0; A \ d'; d2Send];