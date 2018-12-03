function x = window_hanning(signal);
N = length(signal);
for r = 1:N
   x(r) = 0.5-0.5*cos(2*pi*r/N);
end
end