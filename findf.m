function [f, fp, wp, w, delta]=findf(r,t,d,dp)


for i=1:size(r,1)
    for j=1:size(d,2)
        f{i,j}={ };
        fp{i,j}={ };
        delta{i,j}={ };
    end
end


%find f and fp
for i=1:size(r,1)
    for j=1:size(t,1)
        
        dist=sqrt( (r(i,1)-t(j,1))^2 + (r(i,2)-t(j,2))^2 );
        
        if(dist<=d(3))
            f{i,3}=union(f{i,3},int2str(j));
        elseif(dist>d(3) && dist<=d(3)*dp)
            fp{i,3}=union(fp{i,3},int2str(j));
        end
        
        if(dist<=d(2))
            f{i,2}=union(f{i,2},int2str(j));
        elseif(dist>d(2) && dist<=d(2)*dp)
            fp{i,2}=union(fp{i,2},int2str(j));
        end
        
        if(dist<=d(1))
            f{i,1}=union(f{i,1},int2str(j));
        elseif(dist>d(1) && dist<=d(1)*dp)
            fp{i,1}=union(fp{i,1},int2str(j));
        end
            
    end
end

%find delta
for i=1:size(r,1)
    for j=1:3
        if(numel(f{i,j})==0)
            delta{i,j}=fp{i,j};
        elseif(numel(fp{i,j})==0)
            delta{i,j}=f{i,j};
        else
            delta{i,j}=union(f{i,j},fp{i,j});
        end
        w(i,j)=size(f{i,j},2);
        wp(i,j)=size(delta{i,j},2);
    end
end

end