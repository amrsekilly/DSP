% linear convolution as a circular convolution
% the original sequences
xl = [ 1 2 3 4];
hl =[ 1 2 2];

% the sequecnes paded with zeros for length matching for the cconv
x = [ 1 2 3 4 0 0];
h =[ 1 2 2 0 0 0];

% print the linear convolution
linear_convolution = conv(xl, hl)

% print the circular convolution of length L + M - 1
circular_convolution = ifft(fft(x) .* fft(h))