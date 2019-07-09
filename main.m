clc
clear
I= imread('resources/135320_allgrains.png');  
image_full= no_interference(I);
image_full=image_full(1:500, 1:500);
samples = image_cut(image_full);
for i=1:size(samples, 2)
 extention_samples{i}=extention_sample(samples{i},10);
 smoothing_samples{i} = smoothing_filter(extention_samples{i});
 elongation(i)=elongation_of_image(smoothing_samples{i});
 form_factorr(i)=form_factor(extention_samples{i});
end