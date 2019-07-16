clc
clear
I = imread('resources/135320_allgrains.png');  
image_full= no_interference(I);
image_full=image_full(1400:2100, 1050:2200);
sizes = size(image_full);
image_width = sizes(1);
image_height = sizes(2);
global recursion_limit;
recursion_limit = 40000;
%set(0,'RecursionLimit', recursion_limit);
samples = image_cut(image_full);
for i=1:size(samples, 2)
 extention_samples{i}=extention_sample(samples{i},10);
 smoothing_samples{i} = smoothing_filter(extention_samples{i});
 elongation(i)=elongation_of_image(smoothing_samples{i});
 form_factorr(i)=form_factor(extention_samples{i});
end