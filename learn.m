clc
clear
image_full=imread('resources/lalala.png');
image_full=logical(image_full);
image_full=image_full(:,:,1);
samples = image_cut(image_full);
for i=1:size(samples, 2)   
 saved_samples = ['resources/learning_objects/' num2str(i) '.png']; 
 imwrite(samples{i}, saved_samples);
end