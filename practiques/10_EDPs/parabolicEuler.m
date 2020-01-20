function U = parabolicEuler(x,Ax,At,nOfSteps,nOfStepsPlot,ua,ub,f,nu)

%Initialization
Un = zeros(size(f));
Unm1 = f; %solution at time n-1
U = f;

r = At/Ax^2;

%Loop in time steps
for n=1:nOfSteps
    Un(1)=ua(n+1); Un(end)=ub(n+1); % boundary conditions  
    %interior nodes
    Un(2:end-1)=r*nu*Unm1(3:end)+(1-2*r*nu)*Unm1(2:end-1)+r*nu*Unm1(1:end-2);
    if ( mod(n,nOfStepsPlot)==0 | n==nOfSteps )
        U = [U Un];
    end
    Unm1 = Un; %next step
end