% Definition af parametre
frekvens     = 100;
samplelength = 10;
gain         = 1000; %hvad er vores gain?
tid  = [0 : +1/frekvens : samplelength-1/frekvens];

% Måling 1
a1 = load('SidBaseline1.mat');
a1    = a1.data;
a1    = a1(1:length(tid));
a1    = a1*1/gain;
a1_off   = a1-a1(1);


%% Fourier transformation af EMG
L  = samplelength*frekvens;
f  = frekvens*(0:(L/2))/L;

% Måling 1
m1Y  = fft(a1);
m1P2 = abs(m1Y/L);
m1P1 = m1P2(1:L/2+1);
m1P1(2:end-1) = 2*m1P1(2:end-1);

m1Y_off  = fft(a1_off);
m1P2_off = abs(m1Y_off/L);
m1P1_off = m1P2_off(1:L/2+1);
m1P1_off(2:end-1) = 2*m1P1_off(2:end-1);

%% Plot af frekvensanalyse for EMG

figure('name','Ikke-offsetjusteret','numbertitle','off')
% Måling 1
subplot(3,1,1)
semilogy(f, m1P1_off)
xlim([10^-1 10^2])
ylim([0 10e-4])
set(gca,'ytick',[0,0.001, 0.01, 1]*10e-4)
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
title({'Måling 1';'Frekvensanalyse - Siddende Baseline'})
set(gca,'fontsize',20);
box off
grid on

