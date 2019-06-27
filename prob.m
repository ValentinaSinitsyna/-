function [f]=prob(a) 
m=0;
n=0;
M=0;
N=0;
for i=1:length(a)-1
 if a(i)==1
     if a(i)==a(i+1)
     m=m+1;
        if M<m
            M=m;
        end
     end
 else 
     if a(i)==a(i+1)
     n=n+1;
        if N<n
            N=n;
        end
     end
 end
if M>N
    f=1;
else f=0;
end
end