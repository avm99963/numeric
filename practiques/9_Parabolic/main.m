% ATENCIO!!! S'ha de posar al path la carpeta de la pràctica 8 perquè
% funcioni el programa.

clear all

R = 0.00132;
g = [0; -9.8];

f = @(t, z) [z(3); z(4); -R*norm(z(3:4))*z(3) + g(1); -R*norm(z(3:4))*z(4) + g(2)];

v0 = 100;
theta0 = pi/4;
z0 = [0; 0; v0*cos(theta0); v0*sin(theta0)];

% APARTAT 1
fprintf("=== APARTAT 1 ===\n\n");
[t, X] = Euler(f, [0, 10], z0, 20);
figure(1), plot(X(1, :), X(2, :), '-o'), title("Apartat 1"), xlabel("x (m)"), ylabel("y (m)")%, legend('x', 'y', 'x punto', 'y punto')
%figure(100), plot(t, X(2, :), '-o'), title("Apartat 82")%, legend('x', 'y', 'x punto', 'y punto')

fprintf("Posició final:\n");
disp(X(1:2, end));

% APARTAT 2
fprintf("=== APARTAT 2 ===\n\n");
[errabs, errrel] = EulerError(f, [0, 10], z0, 200)
%printf("Error absolut: %s\nError relatiu: %s\n", errabs, errrel);

% APARTAT 3
%fprintf("=== APARTAT 3 ===\n\n");
M = 10:10:200;
err = zeros(1, length(M));
for i = 1:length(M)
    m = M(i);
    [errabsi, erreli] = EulerError(f, [0, 10], z0, m);
    err(i) = erreli;
end

figure(2), plot(log10(M), log10(err)), title("Apartat 3"), xlabel("log_{10}(m)"), ylabel("log_{10}(err)");

% APARTAT 4
fprintf("=== APARTAT 4 ===\n\n");
theta0i = 0.01:0.01:(pi/2);
disti = zeros(1, length(theta0i));
for i = 1:length(theta0i)
    [distii, t] = distancia(f, theta0i(i), v0);
    disti(i) = distii;
end

[distproblema, t] = distancia(f, theta0, v0)

figure(3), plot(theta0i, disti), title("Apartat 5"), xlabel("\theta_0 (rad)"), ylabel("\Delta x (m)");

% APARTAT 5
fprintf("=== APARTAT 5 ===\n\n");
letsbringittozero = @(theta0f)(distancia(f, theta0f, v0) - 500);

x1 = fsolve(letsbringittozero, 1)
x2 = fsolve(letsbringittozero, 0.3)
