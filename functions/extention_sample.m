function [image] = extention_sample (sample, length_of_frame)
IS=size(sample,1);
JS=size(sample,2);
    image=zeros(IS+length_of_frame, JS+length_of_frame);
    image(1:IS+length_of_frame,1:length_of_frame/2)=0; %1
    image(1:length_of_frame/2,length_of_frame/2+1:JS+length_of_frame/2-1)=0; %2
    image(1:IS+length_of_frame, JS+length_of_frame/2:JS+length_of_frame)=0; %3
    image(IS+length_of_frame/2:IS+length_of_frame, length_of_frame/2+1:JS+length_of_frame/2-1)=0; %4
    image(length_of_frame/2+1:IS+length_of_frame/2, length_of_frame/2+1:JS+length_of_frame/2)=sample;
end