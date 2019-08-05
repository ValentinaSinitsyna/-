clc
clear
IIj=imread('resources/135320_allgrains.png');
image_full= no_interference(IIj,5);
samples = image_cut(image_full);
for i=1:size(samples, 2)   
 saved_samples = ['resources/samples/' num2str(i) '.png']; 
 imwrite(samples{i}, saved_samples);
end

%%
clc
for i=1:313
 saved_samples = ['resources/samples/' num2str(i) '.png']; 
 samples{i} = imread(saved_samples); 
 extention_samples{i}=extention_sample(samples{i},10);
 smoothing_samples{i} = smoothing_filter(extention_samples{i});
 [length(i),width(i), elongation(i)]=elongation_of_image(smoothing_samples{i});
 [f_f(i), length_of_the_line(i), square(i)]=form_factor(smoothing_samples{i});
%  saved_samples = ['resources/smoothing/' num2str(i) '.png']; 
%  imwrite(smoothing_samples{i}, saved_samples);
 results(i,1)=i;
 results(i,2)=length(i);
 results(i,3)=width(i);
 results(i,4)=length_of_the_line(i);
 results(i,5)=square(i);
 results(i,6)=f_f(i);
 results(i,7)=elongation(i);

 T=array2table(results, 'VariableNames', {'number_of_image','length','width' , 'length_of_line','square_of_image' , 'form_factor' ,'elongation_of_image'}); 
end
writetable(T,'myData.xlsx');
%%
clc
for i=1:313
    data=xlsread('myData.xlsx'); 
end
normdata(:,1)=data(:,1);
normdata(:,2)=data(:,2);
normdata(:,3)=data(:,3);
normdata(:,4)=data(:,4);
normdata(:,5)=data(:,5);
normdata(:,7)=data(:,7);
normdata(:,6)=normalization_of_the_data(data(:,6));
Tnorm=array2table(normdata, 'VariableNames', {'number_of_image','length','width' , 'length_of_line','square_of_image' , 'form_factor' ,'elongation_of_image'}); 
writetable(Tnorm,'myNormalizedData.xlsx');
%%
plot(normdata(:,6), normdata(:,7),'*b');
