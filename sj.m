function [ s ] = sj( S0,n,j,u,d)
    % calcul de la valeur de l'actif s'il y a eu
    % exactement j montee dans la trajectoire
    s=S0*u^j*d^(n-j);
end

