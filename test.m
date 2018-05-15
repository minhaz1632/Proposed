clc
clear variables

for i=1:10
    refresh
    x=randi([1 100],100,2);
    plot(x,'o');
   pause(2)
    
end