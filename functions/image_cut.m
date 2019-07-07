
function [samples] = image_cut(input_image)
global image;
image = input_image;
samples = {};
image = uint8(image);
%image = delete_border_samples(image);
[x,y] = find(image == 1,1,'first');

while ~isempty([x,y])
    
    fill_sample(x,y);
    new_sample = cut_sample();

    image(image==2) = 0;
    if sum(new_sample(:))>3000
        samples{end+1} = new_sample;
    end
    
   
    [x,y] = find(image == 1,1,'first');
end 

end



 

function [] = fill_sample(x, y)
global image;
sizes = size(image);
width = sizes(1);
height = sizes(2);
image(x,y) = 2;
        if  y < height && image(x,y+1)==1 
            image(x,y+1) = 2;
            fill_sample(x,y+1);
        end
        if  y > 1 && image(x,y-1)==1
            image(x,y-1) = 2;
            fill_sample(x,y-1);
        end
        if x < width && image(x+1,y)==1   
            image(x+1,y) = 2;
            fill_sample(x+1,y);
        end
        if x > 1 && image(x-1,y)==1  
            image(x-1,y) = 2;
            fill_sample(x-1,y);
        end         

end

function [sample] = cut_sample()
global image;
sizes = size(image);
image_width = sizes(1);
image_height = sizes(2);
sample = zeros(1,1);
[x_array, y_array] = find(image==2);
 width = max(x_array) - min(x_array) + 1;
 height = max(y_array) - min(y_array) + 1;

if ~is_border(x_array,y_array,image_width,image_height,width, height,0.2)

   
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
end


    function [answer]  = is_border(x_array,y_array,image_width,image_height,width, height, percent)
       answer = false; 
      
       if sum(x_array==1)/width > percent || sum(x_array==image_height)/width > percent || sum(y_array==1)/height > percent || sum(x_array==image_width)/height > percent
           answer = true;
       end
    end
