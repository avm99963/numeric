clear all

fexercici1=@(x,z) [z(2);-z(1)];
z0=[0;1.15];

%Euler
% m=4; h=1/m;
% z=z0;
% for i=1:m
%  z=z+h*fexercici1(0,z) %no cal posar x_i en aquest cas
% end

%ode45
[x,Z]=ode45(fexercici1,[0,1],z0);
figure(1), plot(x,Z,'-o'), legend('y','dy/dx')
