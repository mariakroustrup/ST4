Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f  = Fs*(0:(L/2))/L;

load('matlab.mat')
data=data*(3.3/2^11);
plot(t,data)
xlabel('Tid [s]');
set(gca,'XTick',[0:1:10])
ylabel('EMG [V]')
ylim([-0.06 0.16])
set(gca,'YTick',[-0.06:0.02:0.16])
set(gca,'fontsize',20);
box off

%% FFT
frekvens     = 100;
samplelength = 10;
gain         = 1000; %hvad er vores gain?
tid  = [0 : +1/frekvens : samplelength-1/frekvens];

% Måling 1
a1    = data;
%a1    = a1(1:length(tid)); % Dette er den rigtige 
a1    = a1(150:900);         % Dette er en temp for at lave fft af selve bevægelsen.
a1    = a1*1/gain;
a1_off    = a1-a1(1);

m1Y  = fft(a1);
m1P2 = abs(m1Y/L);
m1P1 = m1P2(1:L/2+1);
m1P1(2:end-1) = 2*m1P1(2:end-1);


figure
% Måling 1
semilogy(f,m1P1);
%axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
xlim([0 50])
set(gca,'XTick',[0:10:50])
ylim([10^-9 10^-4])
set(gca,'fontsize',20);
box off

