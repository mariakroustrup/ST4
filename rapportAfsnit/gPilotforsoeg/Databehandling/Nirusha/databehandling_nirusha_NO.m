% Definition af parametre
frekvens     = 100;
samplelength = 10;
gain         = 1000; %hvad er vores gain?
tid  = [0 : +1/frekvens : samplelength-1/frekvens];

% Måling 1
Nedogop1 = load('Nedogop1.mat');
a1    = Nedogop1.data(7,:);
a1    = a1(1:length(tid));
a1    = a1*1/gain;

% Måling 2
Nedogop2 = load('Nedogop2.mat');
a2    = Nedogop2.data(7,:);
a2    = a2(1:length(tid));
a2    = a2*1/gain;
% Måling 3
Nedogop3 = load('Nedogop3.mat');
a3    = Nedogop3.data(7,:);
a3    = a3(1:length(tid));
a3    = a3*1/gain;


%% Accelerometer 1

%Måling 1:
b1 = Nedogop1.data(1,:);
b1    = b1(1:length(tid));
b1    = b1-1.6715;
b2 = Nedogop1.data(2,:);
b2    = b2(1:length(tid));
b2    = b2-1.6646;
b3 = Nedogop1.data(3,:);
b3    = b3(1:length(tid));
b3    = b2-1.66805;
b4 = Nedogop1.data(4,:);
b4    = b4(1:length(tid));
b4    = b4-1.6768;
b5 = Nedogop1.data(5,:);
b5    = b5(1:length(tid));
b5    = b5-1.6637;
b6 = Nedogop1.data(6,:);
b6    = b6(1:length(tid));
b6    = b6-1.67025;

% Måling 2:
c1 = Nedogop2.data(1,:);
c1    = c1(1:length(tid));
c1    = c1*1/gain;
c2 = Nedogop2.data(2,:);
c2    = c2(1:length(tid));
c2    = c2*1/gain;
c3 = Nedogop2.data(3,:);
c3    = c3(1:length(tid));
c3    = c3*1/gain;
c4 = Nedogop2.data(4,:);
c4    = c4(1:length(tid));
c4    = c4*1/gain;
c5 = Nedogop2.data(5,:);
c5    = c5(1:length(tid));
c5    = c5*1/gain;
c6 = Nedogop2.data(6,:);
c6    = c6(1:length(tid));
c6    = c6*1/gain;

%Accelerometer 1
d1 = Nedogop3.data(1,:);
d1    = d1(1:length(tid));
d1    = d1*1/gain;
d2 = Nedogop3.data(2,:);
d2    = d2(1:length(tid));
d2    = d2*1/gain;
d3 = Nedogop3.data(3,:);
d3    = d3(1:length(tid));
d3    = d3*1/gain;
d4 = Nedogop3.data(4,:);
d4    = d4(1:length(tid));
d4    = d4*1/gain;
d5 = Nedogop3.data(5,:);
d5    = d5(1:length(tid));
d5    = d5*1/gain;
d6 = Nedogop3.data(6,:);
d6    = d6(1:length(tid));
d6    = d6*1/gain;
%% plotter grafer af EMG og ACC 

figure
subplot(3,1,1)
plot(tid,a1)
axis([0 10 -0.4 0.3])
title('Gennemsnitlig volt målt ved plan op')
xlabel('Tid i sekunder')
ylabel('Spænding målt i volt')
hold on
plot(tid,b1)
hold on
plot(tid, b2)
hold on
plot(tid, b3)
hold on
plot(tid, b4)
hold on
plot(tid, b5)
hold on
plot(tid, b6)
legend(['1.accelerometerx-akse'; '1.accelerometery-akse'; '1.accelerometerz-akse'; '2.acclereromterx-akse'; '2.accelerometery-akse'; '2.accelerometerz-akse'], 'Location', 'southwest'); 

subplot(3,1,2)
plot(tid,a1)
axis([0 10 -0.00001 0.0006])
title('Gennemsnitlig volt målt ved plan op')
xlabel('Tid i sekunder')
ylabel('Spænding målt i volt')
legend(['EMG'])


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
axis([0 10 -0.001 0.002]);
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
axis([0 10 -0.001 0.002]);
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
axis([0 10 -0.001 0.002]);
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
