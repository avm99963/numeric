function distorsioMalla = calculaDistorsioMalla(X,T)
%
% distorsioMalla = calculaDistorsioMalla(X,T)

A = [
    1  -sqrt(3)/3
    0   2*sqrt(3)/3
    ];

% Completar el codi per calcular la distorsi? de la malla amb nodes X i
% connectivitats T
% ...
% ...
% ...

distorsioMalla = 0;
for i = 1:size(T, 1)
  Xe = X(T(i,:),:);
  Dphi = [Xe(2, :) - Xe(1, :); Xe(3, :) - Xe(1, :)]' * A;
  distorsio = norm(Dphi, 'fro')^2/(2*abs(det(Dphi)));
  distorsioMalla = distorsioMalla + distorsio^2;
end

distorsioMalla = sqrt(distorsioMalla);