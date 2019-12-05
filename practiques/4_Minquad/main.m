clear; close all; clc

F = @(x)(1/(1 + 25*x^2));

a = -1;
b = 1;

% for i=1:4
%     n = 2*i;
%     punts = zeros(1, n+1);
%     for j=1:(n+1)
%         punts(j) = 
%     end
%     
% end

% 2. Mínims quadrats

px = [a:(b-a)/200:b]; %200 subintervals a l'interval

figure(2);
hold on;
n = 100;
for i=1:4
    m = 2*i;
    x = zeros(1, n+1);
    for j=1:(n+1)
        x(j) = a + j*(b-a)/n;
    end
    
    y = zeros(1, n+1);
    for j=1:(n+1)
        y(j) = F(x(j));
    end
    
    coeff = polyfit(x, y, m)
    
    py = px;
    for k = 1:200
        py(k) = polyval(coeff, px(k));
    end
    
    plot(px, py);
end
hold off;