function [ pu ] = callAmCRR(S0,K,r,p,u,d,n,j,T)

if(n==T)
    pu=max(S0*u^j*d^(T-j)-K,0);
else
    pu=(1+r)^(-1)*(p*callAmCRR(S0,K,r,p,u,d,n+1,j,T)+(1-p)*callAmCRR(S0,K,r,p,u,d,n+1,j+1,T));

end