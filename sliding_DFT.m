% my implementation of the recursive sliding DFT
clear all
close all
clc
% window length
N = 4;

% original sequence
x = [1 : 4];

% new bit stream
x_new = [1 : 5];

% the DFT on the original sequence
Xk_old = fft(x);

% the sliding DFT equation
Xk_new = exp(Xk_old + x_new(5) - x_new(5 - N)).^((2*pi*i)/N);
Xk_sliding = Xk_new(4)

x_fft = fft(x_new);
normal_fft = x_fft(5)