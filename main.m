clc
clear
image_full = imread('resources/135320_allgrains.png');

%for test purpose
image_full =  image_full(1:500,1:500);


%cutting image into samples
samples  = image_cut(image_full);



 %TODO add filters for samples: delete small ones
 %TODO add function for deleting border samples    
 
 % 1) english only
 % 2) image_cut smaples_edited - ???????? ??? ? ?????????? ??? ??????? 
 % 3) 


