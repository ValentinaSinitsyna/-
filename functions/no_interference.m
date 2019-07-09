function [image] = no_interference(picture);
image=bwmorph(picture, 'erode', 5);
end