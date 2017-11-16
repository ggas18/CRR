function [ call ] = callAmCRR(S0,K,r,p,u,d,n,j,T)
% cette fonction calcule recursivement le prix d'un call americain
% en utilisant exactement la proposition du cours

if(n==T)
    call=max(S0*u^j*d^(T-j)-K,0);
else
    call=(1+r)^(-1)*(p*callAmCRR(S0,K,r,p,u,d,n+1,j,T)+(1-p)*callAmCRR(S0,K,r,p,u,d,n+1,j+1,T));

end