function [y] = evalua_legendre(n,p,an)
    y = 0;
    for i = 1:n+1
        y = y + legendreP(i-1,p)*an(i);
    end
    
    