clc
clear
image_full = imread('resources/135320_allgrains.png');
% image_full= image_ful(500:1500,3000:4000);
samples  = image_cut(image_full);

for i=1:size(samples,2)
  saved_samples = ['resources/' num2str(i+16+12+10+13+46+68+33) '.jpg']; 
  imwrite(samples{i}, saved_samples);
end

 %TODO add filters for samples: delete small ones
 %TODO add function for deleting border samples    