function [y] = evalua_chebyshev(n,p,an)
    y = 0;
    for i = 1:n+1
        y = y + chebyshevT(i-1,p)*an(i);
    end
    
    