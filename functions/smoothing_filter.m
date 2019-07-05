function [k] = smoothing_filter(Z)
BW=edge(Z,'canny');
se90=strel('line', 3, 90);
se0=strel('line', 3, 0);
BWsdil=imdilate(BW, [se90 se0]);
BWdfill=imfill(BWsdil, 'holes');
BWsdil2=imdilate(BWdfill, [se90 se0]);
BWdfill2=imdilate(BWsdil2, [se90 se0]);
k=BWdfill2;
end
