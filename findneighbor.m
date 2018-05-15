function n=findneighbor(id,r)
n=[];
for i=1:size(r,1)
    
    if(i~=id)
        dt=findist(r,id,i);
       if(dt<=30)             %Threshold should be passed as parameter
          n=union(n,i);
       end
    
    end
    
    end

end