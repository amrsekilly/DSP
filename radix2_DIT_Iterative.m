% --- Radix-2 Decimation In Time - Iterative approach

clear all
close all
clc

% the sequence will be of length N
N = 8;

% generate the sequence
x = randn(1, N);
% save the original sequence
xoriginal = x;
% permute the input to get the gray coded permutated input
x = bitrevorder(x);
xhat = zeros(1, N);

% the number of stages = log2 of N, e.g. for 16 bits we have 4 stages
numStages = log2(N);

% calculate the shift coeffecient w
omegaa = exp(-1i * 2 * pi / N);

mulCount = 0;
sumCount = 0;
tic
% loop over each stage
for p = 1 : numStages
    alpha = 2^(p - 1);
    butterflyStart = 1;
    while (butterflyStart <= (N - alpha))
        for interButterflyIndex = 0 : alpha - 1
            xhat(butterflyStart)          = x(butterflyStart) + x(butterflyStart + alpha) * omegaa^(interButterflyIndex * 2^(numStages - p)); 
            xhat(butterflyStart + alpha)  = x(butterflyStart) - x(butterflyStart + alpha) * omegaa^(interButterflyIndex * 2^(numStages - p));
            mulCount = mulCount + 4;
            sumCount = sumCount + 6;
            butterflyStart = butterflyStart + 1;
            if (interButterflyIndex == (alpha - 1))
                butterflyStart = butterflyStart + alpha;
            end;
        end;
    end;
    x = xhat;
end;
timeCooleyTukey = toc;
% print x
x

tic
xhatcheck = fft(xoriginal)
timeFFTW = toc;

rms = 100 * sqrt(sum(sum(abs(xhat - xhatcheck).^2)) / sum(sum(abs(xhat).^2)));

fprintf('Time Cooley-Tukey = %f; \t Time FFTW = %f\n\n', timeCooleyTukey, timeFFTW);
fprintf('Theoretical multiplications count \t = %i; \t Actual multiplications count \t = %i\n', ...
         2 * N * log2(N), mulCount);
fprintf('Theoretical additions count \t\t = %i; \t Actual additions count \t\t = %i\n\n', ...
         3 * N * log2(N), sumCount);
fprintf('Root mean square with FFTW implementation = %.10e\n', rms);