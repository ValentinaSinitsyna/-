function [length_i, length_j,k] = longation (image)
d = regionprops(image, 'MajorAxisLength');
length_i= struct2array(d);
d1 = regionprops(image, 'MinorAxisLength');
length_j= struct2array(d1);
k=length_i/length_j;
end