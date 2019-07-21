clc
clear
I= imread('resources/135320_allgrains.png');  
image_full= no_interference(I);
%image_full=image_full(1:500, 1:500);
samples = image_cut(image_full);

for i=1:size(samples, 2)   
 extention_samples{i}=extention_sample(samples{i},10);
 smoothing_samples{i} = smoothing_filter(extention_samples{i});
 elongation(i)=elongation_of_image(smoothing_samples{i});
 II(i)=size(smoothing_samples{1,i},1);
 J(i)=size(smoothing_samples{1,i},2);
 [f_f(i), length(i), square(i)]=form_factor(extention_samples{i});
 results(i,1)=i;
 results(i,2)=II(i);
 results(i,3)=J(i);
 results(i,4)=length(i);
 results(i,5)=square(i);
 results(i,6)=f_f(i);
 results(i,7)=elongation(i);
 T=array2table(results, 'VariableNames', {'number_of_image','number_of_rows','number_of_columns' , 'length_of_line','square_of_image' , 'form_factor' ,'elongation_of_image'}); 
end
writetable(T,'myData.csv');