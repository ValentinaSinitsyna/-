function [b] = normalization_of_the_data (a)
amin=min(a(:));
amax=max(a(:));
b(:)=(a(:)-amin)/(amax-amin);
end