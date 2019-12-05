function [xd,yd,coeficients]=dibuixaSplineC1Parabolic(x,y);
% [xd,yd,coeficients]=dibuixaSplineCubic(x,S,dS,d2S)
%
% Funci� per dibuixar un spline c�bic C2
% x  : coordenades dels punts base
% S  : valors de la funci� als punts base
% dS : valors de la primera derivada o []
% d2S: valors de la segona derivada o [] (nom�s es fa servir si dS=[])
%
% Es pot dibuixar amb
%  plot(xd,yd)
%

xlen = length(x);

h=x(2:end)-x(1:end-1);
t=y(2:end)-y(1:end-1);

% Calculem valor de la primera derivada
%dsant = (y(2)-y(1))/(x(2)-x(1))
dsant = t(1)/h(1);

coeficients = zeros(xlen-1, 3);

% Per la gràfica de la funció
xd = []; yd = [];
x01 = [0:1/20:1]; %20 subintervals a cada interval

for i=1:(xlen-1)
    coeficients(i,3) = y(i);
    coeficients(i,2) = dsant;
    coeficients(i,1) = t(i)/(h(i)^2) - dsant/h(i);
    
    %dsant = 2*y(i)*h(i)+dsant; % This is wrong
    dsant = 2*coeficients(i,1)*h(i) + coeficients(i,2);
    %dsant = 2*coeficients(i,1)*(x(i+1)-x(i)) + coeficients(i,2);
    
    % Gràfica
    xs = x(i)+x01*h(i); %valors de x a l'interval
    ys = coeficients(i,1)*(xs-x(i)).^2 + coeficients(i,2)*(xs-x(i)) + coeficients(i,3);
    xd = [xd xs]; yd = [yd ys];
end

disp("here");
coeficients


% ------
% 
% 
% xd = []; yd = []; coeficients = [];
% x01 = [0:1/20:1]; %20 subintervals a cada interval
% 
% h=x(2:end)-x(1:end-1);
% t=S(2:end)-S(1:end-1);
% %AMB DERIVADES
% for i=1:length(x)-1
%     a = ( h(i)*(dS(i)+dS(i+1))-2*t(i) )/(h(i)^3);
%     b = ( 3*t(i)-h(i)*(2*dS(i)+dS(i+1)) )/(h(i)^2);
%     c = dS(i);
%     d = S(i) ;
%     xs = x(i)+x01*h(i); %valors de x a l'interval
%     ys = a*(xs-x(i)).^3 + b*(xs-x(i)).^2 + c*(xs-x(i)) + d;
%     xd = [xd xs]; yd = [yd ys]; coeficients=[coeficients; a b c d];
% end