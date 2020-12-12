% Plot spectra of various duty cycles
% Fourier coefficients are obtained using analytical expression
clear; close all; clc;

A = 1;
T = 1;
N = 25; % Number of Fourier coefficients excluding 0th

D = 0:0.01:1;
k = 1:25;

c0 = A*D;
ck = 1j*A./(2*pi*k') .* (e.^(-1j*k'*2*pi*D)-1);

c = [c0; ck];

figure 1;

for i=1:length(D)
    stem(0:N, abs([c0(i) ck(:,i)']))
    axis([0 N 0 A]);
    pause(.05)
end
