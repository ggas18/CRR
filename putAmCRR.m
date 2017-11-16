function [ pu ] = putAmCRR(S0,K,r,p,u,d,n,j,T)
% cette fonction calcule recursivement le prix d'un put americain en 
% utilisant la proposition du cours adaptee au put  et de la programmation
% dynamique.
if(n==T)
    pu=max(K-S0*u^j*d^(T-j),0);
else
    pu1=(1+r)^(-1)*(p*putAmCRR(S0,K,r,p,u,d,n+1,j,T)+....
        (1-p)*putAmCRR(S0,K,r,p,u,d,n+1,j+1,T));
    pu2=K-S0*u^j*d^(n-j);
    pu=max(pu1,pu2);

end

