function [ output_args ] = image_cut( image )
%cut input image to array of samples
%   input: image.png
%   output: 

sizes = size(image);
width = sizes(1);
height = sizes(2);

for i=1:height
    for j=1:width
        if image(i,j)==1

get_sample();



end


function [] = get_sample()


end
