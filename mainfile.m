clc
clear
S = imread('135320_allgrains.png');
BW=sglazh(S);
imshow(BW);