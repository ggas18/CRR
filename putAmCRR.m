function [ pu ] = putAmCRR(S0,K,r,p,u,d,n,j,T)

if(n==T)
    pu=max(K-S0*u^j*d^(T-j),0);
else
    pu=(1+r)^(-1)*(p*putAmCRR(S0,K,r,p,u,d,n+1,j,T)+(1-p)*putAmCRR(S0,K,r,p,u,d,n+1,j+1,T));

end

