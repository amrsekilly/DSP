% circlular convolution of length 4 using DFT
% the filter of length 3
h = [1 2 2];
% the signal
b = [1 2 3 4];
% the frequency version of the h, padded with 0 for length matching
hf = fft([h 0]);
% the freq transform of the b
bf = fft(b);
% get back the result of the circular convlution in the time domain
c = ifft(hf .* bf)