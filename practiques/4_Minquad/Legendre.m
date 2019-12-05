function [] = Legendre(n)
    %aproximacio de f amb polinomi de legendre de grau n
    for i = 1:n+1
        for j = 1:n+1
            integrand = @(x)(legendreP(i-1,x).*legendreP(j-1,x));
            A(i,j) = integral(integrand,-1,1);
        end
        integrand2 = @(x)(legendreP(i-1,x).*f(x));
        b(i) = integral(integrand2,-1,1);
    end
    
    an = A\b';
    
    p = -1:0.01:1;
    
    plot(p,evalua_legendre(n,p,an),p,f(p));
    legend('legendre','f');