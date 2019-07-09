function [k,aa, bb] = elongation_of_image (image);
d = regionprops(image, 'Orientation');
degree= struct2array(d);
figure, bb=imshow(image);
new_image = imrotate(image,degree, 'bilinear');
figure, aa=imshow(new_image);
I=size(image,1);
J=size(image,2);
length_i=0;
length_j=0;
for i=1:I
      a(i)=sum(image(i,:)==1);
end
length_i=max(a(:));
for j=1:J
      b(j)=sum(image(:,j)==1);
end
  length_j=max(b(:));  
  k=length_i/length_j;
end