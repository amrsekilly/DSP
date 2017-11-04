% circlular convolution of length 4 using DFT
% the filter of length 3
h = [1 2 2 0];
% the signal
b = [1 2 3 4];
% the frequency version of the h
hf = fft(h);
% the freq transform of the b
bf = fft(b);
% get back the result of the circular convlution in the time domain
c = ifft(hf .* bf)