function [image] = no_interference(picture,n);
sample=bwmorph(picture, 'erode',n);
IS=size(sample,1);
JS=size(sample,2);
image=zeros(IS-2*n,JS-2*n);
image(1:IS-2*n,1:JS-2*n)=sample(n+1:IS-n,n+1:JS-n);
end