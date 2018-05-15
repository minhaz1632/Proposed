function f=findcomm(of,nf)

for i=1:size(of,2)
    for j=1:size(nf,2)
        
         f{i,j}=intersect(of{i},nf{j});
         
    end
end
 
end