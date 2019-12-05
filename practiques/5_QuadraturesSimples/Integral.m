function I = Integral(f, w, x)

I = 0;
n = size(w, 1);

for i=1:n
    I = I + w(i)*f(x(i));
end