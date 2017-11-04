% circlular convolution of length 4
% the filter of length 3
h = [1 2 2];
% the signal
b = [1 2 3 4];
c = cconv(h,b,4)