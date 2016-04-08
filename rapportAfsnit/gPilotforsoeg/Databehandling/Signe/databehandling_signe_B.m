% Definition af parametre
frekvens     = 100;
samplelength = 10;
gain         = 1000; %hvad er vores gain?
tid  = [0 : +1/frekvens : samplelength-1/frekvens];

% Måling 1
Baseline1 = load('Baseline1.mat');
a1    = Baseline1.data(7,:);
a1    = a1(1:length(tid));
a1    = a1*1/gain;

% Måling 2
Baseline2 = load('Baseline2.mat');
a2    = Baseline2.data(7,:);
a2    = a2(1:length(tid));
a2    = a2*1/gain;
% Måling 3
Baseline3 = load('Baseline3.mat');
a3    = Baseline3.data(7,:);
a3    = a3(1:length(tid));
a3    = a3*1/gain;

%% Fourier transformation
L  = samplelength*frekvens;
f  = frekvens*(0:(L/2))/L;

% Måling 1
m1Y  = fft(a1);
m1P2 = abs(m1Y/L);
m1P1 = m1P2(1:L/2+1);
m1P1(2:end-1) = 2*m1P1(2:end-1);

% Måling 2
m2Y  = fft(a2);
m2P2 = abs(m2Y/L);
m2P1 = m2P2(1:L/2+1);
m2P1(2:end-1) = 2*m2P1(2:end-1);

% Måling 3
m3Y  = fft(a3);
m3P2 = abs(m3Y/L);
m3P1 = m3P2(1:L/2+1);
m3P1(2:end-1) = 2*m3P1(2:end-1);


%Plot
figure
% Måling 1
subplot(2,3,1)
plot(f,m1P1);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
title({'Måling 1';'Frekvensanalyse'})
subplot(2,3,4)
plot(tid,a1);
axis([0 10 -0.001 0.0005]);
xlabel('Tid (s)')
ylabel('Amplitude (V)')
title({'Måling 1';'EMG-signal'})

% Måling 2
subplot(2,3,2)
plot(f,m2P1);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
title({'Måling 2';'Frekvensanalyse'})
subplot(2,3,5)
plot(tid,a2);
axis([0 10 -0.001 0.0005]);
xlabel('Tid (s)')
ylabel('Amplitude (V)')
title({'Måling 2';'EMG-signal'})

% Måling 3
subplot(2,3,3)
plot(f,m3P1);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
title({'Måling 3';'Frekvensanalyse'})
subplot(2,3,6)
plot(tid,a3);
axis([0 10 -0.001 0.0005]);
xlabel('Tid (s)')
ylabel('Amplitude (V)')
title({'Måling 3';'EMG-signal'})



m1Vmax = max(a1)
m1Vmin = min(a1)

m2Vmax = max(a2)
m2Vmin = min(a2)

m3Vmax = max(a3)
m3Vmin = min(a3)

%rms = rms(a(1:1000)) 

%% Resultater.
figure
plot(f,m1P1);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
title('Frekvensanalyse')
set(gca,'fontsize',20);

%% Filtrering

% Definer parameter til filter
% Wp = [50 500]/1000;     % Filter områder
% Ws = [30 900]/1000;     % Her slutter stopband
% Rp = 3;                 % Afvigelse i tvingninger i passband
% Rs = 5;                % Afvigelse i tvingninger i stopband
% -------------------------
%[n,Wn] = buttord(Wp,Ws,Rp,Rs);
%{
Wn = [15]/frekvens/2;
n=2;
[B,A]  = butter(n, Wn,'high'); %højpasfilter - vælg rette knækfrekvens ([?]) og orden (n)
a_filt = filtfilt(B,A,a);

Wn = [400]/frekvens/2;
n=1;
[B,A]  = butter(n, Wn,'low'); %højpasfilter - vælg rette knækfrekvens ([?]) og orden (n
a_filt = filtfilt(B,A,a_filt);

Vmax = max(a_filt)
Vmin = min(a_filt)

Y2  = fft(a_filt);
P22 = abs(Y2/L);
P12 = P22(1 : L/2+1);
P12(2:end-1) = 2*P12(2:end-1);

figure
plot(tid,a_filt)
xlabel('Tid (s)')
ylabel('Amplitude (V)')
title('Filtreret EMG-signal') 
%}
