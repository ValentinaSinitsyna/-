function [length_i, length_j,k, degree] = elongation_of_image (image);
d = regionprops(image, 'Orientation');
degree= struct2array(d);
new_image = imrotate(image,degree,'bilinear');
x=regionprops(new_image,'MajorAxisLength');
length_i = struct2array(x);
J=size(new_image,2);
for j=1:J
      b(j)=sum(new_image(:,j)==1);
end
  length_j=max(b(:));  
  k=length_i/length_j;
end