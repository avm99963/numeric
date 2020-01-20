% @TODO: S'ha d'incloure 8_EDOSEuler al path
clear all; close all; clc

%Solution of the 1D parabolic equation in (a,b)x(0,T)
a = 0; b = 1; %end points
T = 0.2;      %final time

%m = input('Number of spatial intervals (default m=10) = ');
%if(isempty(m)), m=10; end
m = 16; % CAN BE MODIFIED

Ax = (b-a)/m;   %discretization size
x = a:Ax:b;     %nodes

%nOfSteps=input('Number of time steps =');
%if(isempty(nOfSteps)), nOfSteps=ceil(T/(0.5*Ax^2)), end

%nOfSteps = ceil(T/(0.5*Ax^2)); % CAN BE MODIFIED
nOfSteps = 300;

At = T/nOfSteps; %Time step 

% INITIAL AND BOUNDARY CONDITIONS:
% === APARTAT A i APARTAT C ===
%F = @(x) (1-2*abs(x-0.5));
%nu = 1;

% === APARTAT B.i ===
F = @(x) sin(pi*x);
nu = 1;
%nu = 2;

% === APARTAT B.ii ===
%F = @(x) (sin(pi*x) + x.^2);
%nu = 1;

% === CRAZY RUSSIAN HACKER STUFF ===
%F = @(x) sinh(x);
%nu = 1000;

% Postprocessing based on function definition
t = 0:At:T;
f = (F(x))';
ua = ones(size(t))*F(a);
ub = ones(size(t))*F(b);

nOfStepsPlot = ceil(nOfSteps/10); %about 10 plots
%nOfStepsPlot = 1; % ADDON: This shows absolutely all plots if uncommented

%Solution computation
U_ex = parabolicEuler(x,Ax,At,nOfSteps,nOfStepsPlot,ua,ub,f,nu);

%Postprocess
figure(1); plot(x,U_ex); title('Explicit')

displayerror = true;
if displayerror
    %U_ex2 = parabolicEuler(x,Ax,At,2*nOfSteps,nOfStepsPlot,ua,ub,f,nu);
end