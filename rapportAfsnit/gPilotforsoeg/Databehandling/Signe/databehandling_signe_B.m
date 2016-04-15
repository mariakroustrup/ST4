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

a1acc1_x   = Baseline1.data(1,:);
a1acc1_x   = a1acc1_x(1:length(tid));
a1acc1_y   = Baseline1.data(2,:);
a1acc1_y   = a1acc1_y(1:length(tid));
a1acc1_z   = Baseline1.data(3,:);
a1acc1_z   = a1acc1_z(1:length(tid));
a1acc2_x   = Baseline1.data(4,:);
a1acc2_x   = a1acc2_x(1:length(tid));
a1acc2_y   = Baseline1.data(5,:);
a1acc2_y   = a1acc2_y(1:length(tid));
a1acc2_z   = Baseline1.data(6,:);
a1acc2_z   = a1acc2_z(1:length(tid));

% Måling 2
Baseline2 = load('Baseline2.mat');
a2    = Baseline2.data(7,:);
a2    = a2(1:length(tid));
a2    = a2*1/gain;

a2acc1_x   = Baseline2.data(1,:);
a2acc1_x   = a2acc1_x(1:length(tid));
a2acc1_y   = Baseline2.data(2,:);
a2acc1_y   = a2acc1_y(1:length(tid));
a2acc1_z   = Baseline2.data(3,:);
a2acc1_z   = a2acc1_z(1:length(tid));
a2acc2_x   = Baseline2.data(4,:);
a2acc2_x   = a2acc2_x(1:length(tid));
a2acc2_y   = Baseline2.data(5,:);
a2acc2_y   = a2acc2_y(1:length(tid));
a2acc2_z   = Baseline2.data(6,:);
a2acc2_z   = a2acc2_z(1:length(tid));

% Måling 3
Baseline3 = load('Baseline3.mat');
a3    = Baseline3.data(7,:);
a3    = a3(1:length(tid));
a3    = a3*1/gain;

a3acc1_x   = Baseline3.data(1,:);
a3acc1_x   = a3acc1_x(1:length(tid));
a3acc1_y   = Baseline3.data(2,:);
a3acc1_y   = a3acc1_y(1:length(tid));
a3acc1_z   = Baseline3.data(3,:);
a3acc1_z   = a3acc1_z(1:length(tid));
a3acc2_x   = Baseline3.data(4,:);
a3acc2_x   = a3acc2_x(1:length(tid));
a3acc2_y   = Baseline3.data(5,:);
a3acc2_y   = a3acc2_y(1:length(tid));
a3acc2_z   = Baseline3.data(6,:);
a3acc2_z   = a3acc2_z(1:length(tid));

%% Fourier transformation af EMG
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


%% Frekvensanalyse af accelerometer 
% Måling 1
m1acc1_x  = fft(a1acc1_x);
m1P2acc1_x = abs(m1acc1_x/L);
m1P1acc1_x = m1P2acc1_x(1:L/2+1);
m1P1acc1_x(2:end-1) = 2*m1P1acc1_x(2:end-1);

m1acc1_y  = fft(a1acc1_y);
m1P2acc1_y = abs(m1acc1_y/L);
m1P1acc1_y = m1P2acc1_y(1:L/2+1);
m1P1acc1_y(2:end-1) = 2*m1P1acc1_y(2:end-1);

m1acc1_z  = fft(a1acc1_z);
m1P2acc1_z = abs(m1acc1_z/L);
m1P1acc1_z = m1P2acc1_z(1:L/2+1);
m1P1acc1_z(2:end-1) = 2*m1P1acc1_z(2:end-1);

m1acc2_x  = fft(a1acc2_x);
m1P2acc2_x = abs(m1acc2_x/L);
m1P1acc2_x = m1P2acc2_x(1:L/2+1);
m1P1acc2_x(2:end-1) = 2*m1P1acc2_x(2:end-1);
 
m1acc2_y  = fft(a1acc2_y);
m1P2acc2_y = abs(m1acc2_y/L);
m1P1acc2_y = m1P2acc2_y(1:L/2+1);
m1P1acc2_y(2:end-1) = 2*m1P1acc2_y(2:end-1);
 
m1acc2_z  = fft(a1acc2_z);
m1P2acc2_z = abs(m1acc2_z/L);
m1P1acc2_z = m1P2acc2_z(1:L/2+1);
m1P1acc2_z(2:end-1) = 2*m1P1acc2_z(2:end-1);

% Måling 2

m2acc1_x  = fft(a2acc1_x);
m2P2acc1_x = abs(m2acc1_x/L);
m2P1acc1_x = m2P2acc1_x(1:L/2+1);
m2P1acc1_x(2:end-1) = 2*m2P1acc1_x(2:end-1);
 
m2acc1_y  = fft(a2acc1_y);
m2P2acc1_y = abs(m2acc1_y/L);
m2P1acc1_y = m2P2acc1_y(1:L/2+1);
m2P1acc1_y(2:end-1) = 2*m2P1acc1_y(2:end-1);
 
m2acc1_z  = fft(a2acc1_z);
m2P2acc1_z = abs(m2acc1_z/L);
m2P1acc1_z = m2P2acc1_z(1:L/2+1);
m2P1acc1_z(2:end-1) = 2*m2P1acc1_z(2:end-1);
 
m2acc2_x  = fft(a2acc2_x);
m2P2acc2_x = abs(m2acc2_x/L);
m2P1acc2_x = m2P2acc2_x(1:L/2+1);
m2P1acc2_x(2:end-1) = 2*m2P1acc2_x(2:end-1);
 
m2acc2_y  = fft(a2acc2_y);
m2P2acc2_y = abs(m2acc2_y/L);
m2P1acc2_y = m2P2acc2_y(1:L/2+1);
m2P1acc2_y(2:end-1) = 2*m2P1acc2_y(2:end-1);
 
m2acc2_z  = fft(a2acc2_z);
m2P2acc2_z = abs(m2acc2_z/L);
m2P1acc2_z = m2P2acc2_z(1:L/2+1);
m2P1acc2_z(2:end-1) = 2*m2P1acc2_z(2:end-1);

% Måling 3

m3acc1_x  = fft(a3acc1_x);
m3P2acc1_x = abs(m3acc1_x/L);
m3P1acc1_x = m3P2acc1_x(1:L/2+1);
m3P1acc1_x(2:end-1) = 2*m3P1acc1_x(2:end-1);
 
m3acc1_y  = fft(a3acc1_y);
m3P2acc1_y = abs(m3acc1_y/L);
m3P1acc1_y = m3P2acc1_y(1:L/2+1);
m3P1acc1_y(2:end-1) = 2*m3P1acc1_y(2:end-1);
 
m3acc1_z  = fft(a3acc1_z);
m3P2acc1_z = abs(m3acc1_z/L);
m3P1acc1_z = m3P2acc1_z(1:L/2+1);
m3P1acc1_z(2:end-1) = 2*m3P1acc1_z(2:end-1);
 
m3acc2_x  = fft(a3acc2_x);
m3P2acc2_x = abs(m3acc2_x/L);
m3P1acc2_x = m3P2acc2_x(1:L/2+1);
m3P1acc2_x(2:end-1) = 2*m3P1acc2_x(2:end-1);
 
m3acc2_y  = fft(a3acc2_y);
m3P2acc2_y = abs(m3acc2_y/L);
m3P1acc2_y = m3P2acc2_y(1:L/2+1);
m3P1acc2_y(2:end-1) = 2*m3P1acc2_y(2:end-1);
 
m3acc2_z  = fft(a3acc2_z);
m3P2acc2_z = abs(m3acc2_z/L);
m3P1acc2_z = m3P2acc2_z(1:L/2+1);
m3P1acc2_z(2:end-1) = 2*m3P1acc2_z(2:end-1);


%% Plot af frekvensanalyse for EMG
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

%% Plot ACC

% Måling 1

figure('name','ACC måling 1','numbertitle','off')
%subplot(2,3,1)
semilogx(f,m1P1acc1_x);
% axis([0 60 0 2]);
xlabel('Frekvens [Hz]')
xlim([10^-1 10^2])
ylabel('Størrelse')
ylim([0 1.4*10^-3])
%title({'Accelerometer 1 - x-aksen';'Frekvensanalyse'})
set(gca,'fontsize',20);
box off

% subplot(2,3,2)
% plot(f,m1P1acc1_y);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 1 - y-aksen';'Frekvensanalyse'})
% subplot(2,3,3)
% plot(f,m1P1acc1_z);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 1 - z-aksen';'Frekvensanalyse'})
% subplot(2,3,4)
% plot(f,m1P1acc2_x);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 2 - x-aksen';'Frekvensanalyse'})
% subplot(2,3,5)
% plot(f,m1P1acc2_y);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 2 - y-aksen';'Frekvensanalyse'})
% subplot(2,3,6)
% plot(f,m1P1acc2_z);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 2 - z-aksen';'Frekvensanalyse'})

% Måling 2

% figure('name','ACC måling 2','numbertitle','off')
% subplot(2,3,1)
% plot(f,m2P1acc1_x);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 1 - x-aksen';'Frekvensanalyse'})
% subplot(2,3,2)
% plot(f,m2P1acc1_y);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 1 - y-aksen';'Frekvensanalyse'})
% subplot(2,3,3)
% plot(f,m2P1acc1_z);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 1 - z-aksen';'Frekvensanalyse'})
% subplot(2,3,4)
% plot(f,m2P1acc2_x);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 2 - x-aksen';'Frekvensanalyse'})
% subplot(2,3,5)
% plot(f,m2P1acc2_y);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 2 - y-aksen';'Frekvensanalyse'})
% subplot(2,3,6)
% plot(f,m2P1acc2_z);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 2 - z-aksen';'Frekvensanalyse'})
% 
% % Måling 3
% 
% figure('name','ACC måling 3','numbertitle','off')
% subplot(2,3,1)
% plot(f,m3P1acc1_x);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 1 - x-aksen';'Frekvensanalyse'})
% subplot(2,3,2)
% plot(f,m3P1acc1_y);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 1 - y-aksen';'Frekvensanalyse'})
% subplot(2,3,3)
% plot(f,m3P1acc1_z);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 1 - z-aksen';'Frekvensanalyse'})
% subplot(2,3,4)
% plot(f,m3P1acc2_x);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 2 - x-aksen';'Frekvensanalyse'})
% subplot(2,3,5)
% plot(f,m3P1acc2_y);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 2 - y-aksen';'Frekvensanalyse'})
% subplot(2,3,6)
% plot(f,m3P1acc2_z);
% axis([0 60 0 2]);
% xlabel('Frekvens (Hz)')
% ylabel('Størrelse')
% title({'Accelerometer 2 - z-aksen';'Frekvensanalyse'})


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
