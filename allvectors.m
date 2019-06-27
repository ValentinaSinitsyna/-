function [v]=allvectors(D)
v=0;
v1=D(2,:);
v2=D(:,2);
v3=D(end-1,:);
v4=D(:,end-1);
V1=prob(v1);
V2=prob(v2);
V3=prob(v3);
V4=prob(v4);

if (V1==1)||(V2==1)||(V3==1)||(V4==1)
    v=1;
else v=0;
    
end
end