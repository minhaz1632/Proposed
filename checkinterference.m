function flag=checkinterference(f,fp,sol,i,n)

flag=0;
for j=1:size(n,2)
    temp=sol(i);
    temp2=sol(n(j));
    if(temp~=0 && temp2~=0)
         temp3=intersect(f{i,temp},fp{n(j),temp2});
        if(numel(temp3)~=0)
            flag=1;
            break
        end
    end
end

end