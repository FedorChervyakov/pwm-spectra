% Plot spectra of various duty cycles
% Fourier coefficients are obtained using analytical expression
clear; close all; clc;

A = 1;
T = 1;
N = 25; % Number of Fourier coefficients excluding 0th

D = 0:0.01:1;
k = 1:N;

time_step = 1e-3;
t = 0:time_step:T-time_step;

%% Compute Fourier coefficients
c0 = A*D;
ck = 1j*A./(2*pi*k') .* (exp(-1j*k'*2*pi*D)-1);
c = [c0; ck];

%% Compute time-domain representation
x = c0' + 2*real(ck'*exp(-j*k'*2*pi/T*t));

figure 1;

for i=1:length(D)
    % Plot signal in time-domain
    subplot(3, 1, 1);
    plot(t, x(i, :))
    axis([0 T -A/5 A*1.2]);
    tit1 = sprintf("Duty-cycle = %.2f", D(i));
    title(tit1)

    % Plot Fourier coefficients
    % Magnitude
    subplot(3, 1, 2);
    stem(0:N, abs([c0(i) ck(:,i)']))
    axis([0 N 0 A/pi]);
    tit2 = sprintf("Magnitude of first %d Fourier coefficients, c0 = %.2f", N, c0(i));
    title(tit2)

    % Angle
    subplot(3, 1, 3);
    stem(0:N, angle([c0(i) ck(:,i)']))
    axis([0 N -pi pi]);
    tit3 = sprintf("Angle of first %d Fourier coefficients", N);
    title(tit3)

    pause(.05)
end
