%% block 1 - cutting images
clc
clear
I= imread('resources/135320_allgrains.png'); 
BW1=bwmorph(I, 'erode', 5); 
image_full= BW1(1:1000,1:500);
samples = image_cut(image_full);
for i=1:size(samples,2)
 extention_samples{i}=extention_sample(samples{i},10);
 smoothing_samples{i} = smoothing_filter(extention_samples{i});
 elongation(i)=elongation_of_image(smoothing_samples{i});
end
%% block 2 - examples for using my functions and code for saving samples to
% files
for i=1:size(samples,2)
  extention_samples{i}=extention_sample(samples{i},10);
  smoothing_samples{i} = smoothing_filter(extention_samples{i})
  saved_samples = ['resources/smoothing/' num2str(i) '.jpg']; 
  imwrite(smoothing_samples{i}, saved_samples);
end
 %% block 3 - code for using saved images +  functions for making smoothing samples and saving them to new file 
for i=1:198
    saved_samples = ['resources/' num2str(i) '.jpg']; 
    samples{i} = imread(saved_samples); 
    extention_samples{i}=extention_sample(samples{i},10);
    smoothing_samples{i} = smoothing_filter(extention_samples{i});
    saved_samples1 = ['resources/smoothing/sm' num2str(i) '.jpg']; 
   
    imwrite(smoothing_samples{i}, saved_samples1);
end