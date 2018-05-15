function final_sol=adjust(i,r,sol,f,fp,w)

n=findneighbor(i,r);

for j=1:size(n,2)
    temp=sol(i);
    temp2=sol(n(j));
    if(temp~=0 && temp2~=0)
        temp3=intersect(f{i,temp},fp{n(j),temp2});
        if(numel(temp3)==0 && sol(i)<3)
            sol(i)=sol(i)+1;
            flag=checkinterference(f,fp,sol,i,n);
            if(flag==1)
                sol(i)=sol(i)-1;
            end
        elseif(numel(temp3)~=0 && w(i,temp)<w(n(j),temp2))
            sol(i)=sol(i)-1;
            for k=1:size(n,2)
                sol=adjust(n(k),r,sol,f,fp,w);
            end
        elseif(numel(temp3)~=0 && w(i,temp)==w(n(j),temp2) && i<n(j))
            fprintf('Both w are equla\n')
            sol(i)=sol(i)-1;
            for k=1:size(n,2)
                sol=adjust(n(k),r,sol,f,fp,w);
            end
            
        end
    end
end
final_sol=sol;
end