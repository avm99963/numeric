function [dist, t] = distancia(f, theta0, v0)
    z0 = [0; 0; v0*cos(theta0); v0*sin(theta0)];
    options = odeset('Events', 'myEventsFcn');
    [x, z] = ode45(f, [0, 100], z0, options);
    dist = z(end, 1);
    t = x(end);
end
