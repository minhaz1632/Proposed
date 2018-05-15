clc
clear variables
r=[15 23;34 39;40 15;58 30];

t=[12 25;12 30;5 28;22 31;12 13;26 34;46 37;31 41;44 49;37 29;29.5 25;32 18;48 20;44 11;39 11];
d=[5 10 15];
dp=1.15;
alpha=6;
alphap=6;
[f, fp, wp, w, delta]=findf(r,t,d,dp);
sol=[];

for i=1:numel(w)
    if(w(i)>alpha)
        w(i)=0;
    end
end

for i=1:size(r,1)
   sol(i)= findsol(i,r,f,fp,delta,w);
end

cov=0;
for i=1:numel(sol)
    if sol(i)~=0
    cov=cov+w(i,sol(i));
    end
end
cov

