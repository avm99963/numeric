function I = simpson(f, a, b)
I = (b-a)/2*(1/3*f(a) + 4/3*f((a+b)/2) + 1/3*f(b));