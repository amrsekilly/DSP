
% Let h(n) = {?4, 1, ?1, ?2, 5, 6, 5, ?2, ?1, 1, ?4}. Determine the amplitude re- ?
% sponse Hr (?) and the locations of the zeros of H (z).

% we know that it's a type-1 FIR, cuz it's odd and symmetric about n

% the filter
h = [-4,1,-1,-2,5,6,5,-2,-1,1,-4];
% get the number of samples of the filter (length of filter)
M = length(h); n = 0:M-1;

% use the type1 FIR function to define the filter
[Hr,w,a,L] = Hr_Type1(h);

% get the amplitude
amax = max(a)+1; amin = min(a)-1;

% plot the impulse response of the filter
subplot(2,2,1); stem(n,h); axis([-1 2*L+1 amin amax])

