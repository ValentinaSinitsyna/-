function [length_i, length_j,k] = elongation_of_image (image);
d = regionprops(image, 'Orientation');
degr= struct2array(d);
degree=abs(degr);
newimage = imrotate(image,degree,'bilinear','crop');
I=size(newimage,1);
J=size(newimage,2);
for i=1:I
    for j=1:J
       if (newimage(i,j)<=1)&&(newimage(i,j)>0.5)
               new_image(i,j)=1;
       else    new_image(i,j)=0;
       end
    end
end
for i=1:I
      b(i)=sum(new_image(i,:)==1);
end
for j=1:J
      a(j)=sum(new_image(:,j)==1);
end
  length_j=max(b(:)); 
  length_i=max(a(:));
  k=length_j/length_i;
end