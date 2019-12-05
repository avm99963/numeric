function pesos = Pesos(f, x)
V = fliplr(vander(x))';

a = x(1);
b = x(end);
n = size(x, 1);

t = zeros(n, 1);

for i=1:n
    t(i) = (b^i - a^i)/i;
end

pesos = V \ t;