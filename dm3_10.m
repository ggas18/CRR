%% calcul du call et Put americain CRR
clear;clc

S0=1;K=1;T=10;b=-0.02;h=0.03;r=0.01;p=(h-r)/(h-b);
j_r=-T*log(1+h)/log((1+b)/(1+h));
C0=0;
for j=0:floor(j_r)
    C0=C0+nchoosek(T,j)*p^j*(1-p)^(T-j)*(S0*(1+b)^j*(1+h)^(T-j)-K);
end
C0=C0/(1+r)^T;
% utilisation de la relation de paritee call-put pour retrouver le prix du
% put
P0=C0-S0+K*(1+r)^(-T);
% nombre de simulation de la v.a
N=1000;
S1=0;% somme des Yi
S2=0;% sommes des carres des Yi
for i=1:N
    % simulation d'une B(T,p)
    X=binornd(T,p);Y=max(S0*(1+b)^X*(1+h)^(T-X)-K,0);
    S1=S1+Y;S2=S2+Y^2;
end
% calcul d'experance et actualisation
C0_mc=(1+r)^(-T)*S1/N;
% l' ecart-type de l'estimation
s=sqrt((S2-S1^2/N)/(N-1));

u=1+h;
d=1+b;

%  utilisation d'une fonction recursive
Pam0=putAmCRR(S0,K,r,p,u,d,0,0,T);
Cam0=callAmCRR(S0,K,r,p,u,d,0,0,T);

% vecteur ouu on n'a que des hausses
v1=[sj(S0,0,0,u,d) sj(S0,1,1,u,d) sj(S0,2,2,u,d) sj(S0,3,3,u,d) ....
    sj(S0,4,4,u,d) sj(S0,5,5,u,d) sj(S0,6,6,u,d) sj(S0,7,7,u,d) ....
    sj(S0,8,8,u,d) sj(S0,9,9,u,d) sj(S0,10,10,u,d)];
v2=[sj(S0,0,0,u,d) sj(S0,1,0,u,d) sj(S0,2,0,u,d) sj(S0,3,0,u,d) ....
    sj(S0,4,0,u,d) sj(S0,5,0,u,d) sj(S0,6,0,u,d) sj(S0,7,0,u,d) ....
    sj(S0,8,0,u,d) sj(S0,9,0,u,d) sj(S0,10,0,u,d)];

v3=[sj(S0,0,0,u,d) sj(S0,1,1,u,d) sj(S0,2,1,u,d) sj(S0,3,2,u,d) ....
    sj(S0,4,2,u,d) sj(S0,5,3,u,d) sj(S0,6,3,u,d) sj(S0,7,4,u,d) ....
    sj(S0,8,4,u,d) sj(S0,9,5,u,d) sj(S0,10,5,u,d)];

v4=[sj(S0,0,0,u,d) sj(S0,1,0,u,d) sj(S0,2,1,u,d) sj(S0,3,1,u,d) ....
    sj(S0,4,2,u,d) sj(S0,5,2,u,d) sj(S0,6,2,u,d) sj(S0,7,3,u,d) ....
    sj(S0,8,3,u,d) sj(S0,9,4,u,d) sj(S0,10,5,u,d)];

v5=[sj(S0,0,0,u,d) sj(S0,1,0,u,d) sj(S0,2,1,u,d) sj(S0,3,2,u,d) ....
    sj(S0,4,3,u,d) sj(S0,5,4,u,d) sj(S0,6,4,u,d) sj(S0,7,5,u,d) ....
    sj(S0,8,5,u,d) sj(S0,9,6,u,d) sj(S0,10,6,u,d)];

[val1,pos1]=max(v1); % 10 naturellement, car il y a eu que des montees
[val2,pos2]=max(v2); % 0 car le cours n'a fait que baisser
[val3,pos3]=max(v3); % 9
[val4,pos4]=max(v4); % 10
[val5,pos5]=max(v4); % 10
    