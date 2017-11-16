function [ call ] = callAmCRR(S0,K,r,p,u,d,n,j,T)
% cette fonction calcule recursivement le prix d'un call americain
% en utilisant exactement la proposition du cours et de la programmation
% dynamique

if(n==T)
    call=max(S0*u^j*d^(T-j)-K,0);
else
    call1=(1+r)^(-1)*(p*callAmCRR(S0,K,r,p,u,d,n+1,j,T)+(1-p)*callAmCRR(S0,K,r,p,u,d,n+1,j+1,T));
    call2=S0*u^j*d^(n-j)-K;
    call=max(call1,call2);
end