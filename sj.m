function [ s ] = sj( S0,n,j,u,d)
    s=S0*u^j*d^(n-j);
end

