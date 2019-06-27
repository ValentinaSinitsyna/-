function [k] = kolvoedinits(Z)
k=0;
L=size(Z,1);
M=size(Z,2);
for i=1:L
    for j=1:M
       if Z(i,j)==1
        k=k+1;
       end
    end
end
end