% FIR using overlap add FFT method

% filter with length M = 4
f = [1, 4, 8, 2];

% signal to be filtered of length L = 20
x = [1:20];

% the overlap FIR filtering of length L, after doing the overlap of the FFT
% and adding the overlapped areas
output = fftfilt(f, x)