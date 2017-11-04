
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
xlabel('n'); ylabel('h(n)'); title('Impulse Response')

% get the amplitude coeffecients
subplot(2,2,3); stem(0:L,a); axis([-1 2*L+1 amin amax]) 
xlabel('n'); ylabel('a(n)'); title('a(n) coefficients')

% plot the amplitude freq response
subplot(2,2,2); plot(w/pi,Hr); grid
xlabel('frequency in pi units'); ylabel('Hr')
title('Type-1 Amplitude Response')
subplot(2,2,4); pzplot(h,1)


