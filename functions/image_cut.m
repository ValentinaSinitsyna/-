function [samples] = image_cut(image)
samples = {};
image = uint8(image);
[x,y] = find(image == 1,1,'first');

while ~isempty([x,y])
    image = fill_sample(image,x,y);
    new_sample = cut_sample(image);
    image(image==2) = 0;
    samples{end+1} = new_sample; 
    %samples = cat(3,samples,new_sample);
    [x,y] = find(image == 1,1,'first');
end 

end


function [image] = fill_sample(image, x, y)
sizes = size(image);
width = sizes(1);
height = sizes(2);
 image(x,y) = 2;
        if  y < height && image(x,y+1)==1 
            image(x,y+1) = 2;
            image = fill_sample(image,x,y+1);
        end
        if  y > 1 && image(x,y-1)==1
            image(x,y-1) = 2;
            image = fill_sample(image,x,y-1);
        end
        if x < width && image(x+1,y)==1   
            image(x+1,y) = 2;
            image = fill_sample(image,x+1,y);
        end
        if x > 1 && image(x-1,y)==1  
            image(x-1,y) = 2;
            image = fill_sample(image,x-1,y);
        end         

end

function [sample] = cut_sample(image)
[x_array, y_array] = find(image==2);
width = max(x_array) - min(x_array) + 1;
height = max(y_array) - min(y_array) + 1;

x_start = min(x_array) - 1;
y_start = min(y_array) - 1;

sample = zeros(width,height);

for i=min(x_array):max(x_array)
    for j=min(y_array):max(y_array)
        if image(i,j)==2
            sample( i - x_start,j - y_start) = 1;
        end
    end
end
end


 