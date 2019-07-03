function [ff] = form_factor (image)
smoothing_image = smoothing_filter(image);
BW=edge(image,'canny');
W=edge(smoothing_image,'canny');
Length_of_image=number_of_uints(BW);
Square_of_image=number_of_uints(W);
ff=Length_of_image*Length_of_image/Square_of_image;
end

function [k] = number_of_uints(Z)
k=0;
L=size(Z,1);
M=size(Z,2);
for i=1:L
    for j=1:M
       if Z(i,j)==1
        k=k+1;
       end
    end
end
end