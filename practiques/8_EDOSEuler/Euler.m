function [x,Y] = Euler(f, limits, y0, npassos)
h = (limits(2)-limits(1))/npassos;
x = [0];
Y = [y0];

y = y0;
for i=0:(npassos - 1)
    y = y + h*f(i*h, y);
    x = [x, (i+1)*h];
    Y = [Y, y];
end