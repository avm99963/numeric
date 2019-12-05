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
figure(1), plot(X(1, :), X(2, :), '-o')%, legend('x', 'y', 'x punto', 'y punto')

fprintf("Posició final:\n");
disp(X(1:2, end));

% APARTAT 2
fprintf("=== APARTAT 2 ===\n\n");
[errabs, errrel] = EulerError(f, [0, 10], z0, 200)
%printf("Error absolut: %s\nError relatiu: %s\n", errabs, errrel);

% APARTAT 3
M = 10:10:200;
err = zeros(1, length(M));
for i = 1:length(M)
    m = M(i);
    [errabsi, erreli] = EulerError(f, [0, 10], z0, m);
    err(i) = erreli;
end

M
err

figure(2), plot(M, err);