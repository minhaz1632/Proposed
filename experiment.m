clc
clear variables
r=randi([0 200],200,2);

d=[5 10 15];
dp=[1.15 1.25 1.35];
alpha=10;
alphap=10;
t=randi([0 200],1000,2);
[f, fp, wp, w, delta]=findf(r,t,d,dp(2));
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

