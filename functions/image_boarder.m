function [v]=image_boarder(D)
v1=D(1,:);
v2=D(:,1);
v3=D(end,:);
v4=D(:,end);
V1=maximum_length(v1);
V2=maximum_length(v2);
V3=maximum_length(v3);
V4=maximum_length(v4);

if (V1==1)||(V2==1)||(V3==1)||(V4==1)
    v=1;
else v=0;
    
end
end


function [f]=maximum_length(a) 
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
end