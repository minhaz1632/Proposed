function sol=findsol(id,r,f,fp,delta,w)

sol=0;
n=findneighbor(id,r);
of=f(id,:);
ofp=fp(id,:);

for i=1:size(n,2)
    nf(i,:)=f(n(i),:);
    ndelta(i,:)=delta(n(i),:);
end

for i=1:size(n,2)

    if(i==1)
        comm=findcomm(of,ndelta(i,:));
    else
        comm(:,:,i)=findcomm(of,ndelta(i,:));
    end
    
end

flag=0;
sflag=1;

for i=3:-1:1
    if(w(id,i)==0)
        continue
    end
    for j=1:size(n,2)
        for k=3:-1:1
            if(numel(comm{i,k,j})==0)
                continue
            elseif(w(id,i)>=w(n(j),k))
                continue
            else
                flag=1;
                sflag=0;
                break
            end
        end
        
        if(flag==1)
            flag=0;
            break
        end
    end
    
    if(sflag==1)
        sol=i;
        break
    else
        sflag=1;
    end
    
end

end