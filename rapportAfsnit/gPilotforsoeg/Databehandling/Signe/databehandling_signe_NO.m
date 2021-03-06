% Definition af parametre
frekvens     = 100;
samplelength = 10;
gain         = 1000; %hvad er vores gain?
tid  = [0 : +1/frekvens : samplelength-1/frekvens];

% M�ling 1
Nedogop1 = load('Nedogop1.mat');
a1    = Nedogop1.data(7,:);
%a1    = a1(1:length(tid)); % Dette er den rigtige 
a1    = a1(150:900);         % Dette er en temp for at lave fft af selve bev�gelsen.
a1    = a1*1/gain;
a1_off    = a1-a1(1);

a1acc1_x   = Nedogop1.data(1,:);
a1acc1_x   = a1acc1_x(1:length(tid));
a1acc1_y   = Nedogop1.data(2,:);
a1acc1_y   = a1acc1_y(1:length(tid));
a1acc1_z   = Nedogop1.data(3,:);
a1acc1_z   = a1acc1_z(1:length(tid));
a1acc2_x   = Nedogop1.data(4,:);
a1acc2_x   = a1acc2_x(1:length(tid));
a1acc2_y   = Nedogop1.data(5,:);
a1acc2_y   = a1acc2_y(1:length(tid));
a1acc2_z   = Nedogop1.data(6,:);
a1acc2_z   = a1acc2_z(1:length(tid));

% M�ling 2
Nedogop2 = load('Nedogop2.mat');
a2    = Nedogop2.data(7,:);
a2    = a2(1:length(tid));
a2    = a2*1/gain;
a2_off    = a2-a2(1);

a2acc1_x   = Nedogop2.data(1,:);
a2acc1_x   = a2acc1_x(1:length(tid));
a2acc1_y   = Nedogop2.data(2,:);
a2acc1_y   = a2acc1_y(1:length(tid));
a2acc1_z   = Nedogop2.data(3,:);
a2acc1_z   = a2acc1_z(1:length(tid));
a2acc2_x   = Nedogop2.data(4,:);
a2acc2_x   = a2acc2_x(1:length(tid));
a2acc2_y   = Nedogop2.data(5,:);
a2acc2_y   = a2acc2_y(1:length(tid));
a2acc2_z   = Nedogop2.data(6,:);
a2acc2_z   = a2acc2_z(1:length(tid));


% M�ling 3
Nedogop3 = load('Nedogop3.mat');
a3    = Nedogop3.data(7,:);
a3    = a3(1:length(tid));
a3    = a3*1/gain;
a3_off    = a3-a3(1);

a3acc1_x   = Nedogop3.data(1,:);
a3acc1_x   = a3acc1_x(1:length(tid));
a3acc1_y   = Nedogop3.data(2,:);
a3acc1_y   = a3acc1_y(1:length(tid));
a3acc1_z   = Nedogop3.data(3,:);
a3acc1_z   = a3acc1_z(1:length(tid));
a3acc2_x   = Nedogop3.data(4,:);
a3acc2_x   = a3acc2_x(1:length(tid));
a3acc2_y   = Nedogop3.data(5,:);
a3acc2_y   = a3acc2_y(1:length(tid));
a3acc2_z   = Nedogop3.data(6,:);
a3acc2_z   = a3acc2_z(1:length(tid));

%% EMG FFT
L  = samplelength*frekvens;
f  = frekvens*(0:(L/2))/L;

% M�ling 1
m1Y  = fft(a1);
m1P2 = abs(m1Y/L);
m1P1 = m1P2(1:L/2+1);
m1P1(2:end-1) = 2*m1P1(2:end-1);

m1Y_off  = fft(a1_off);
m1P2_off = abs(m1Y_off/L);
m1P1_off = m1P2_off(1:L/2+1);
m1P1_off(2:end-1) = 2*m1P1_off(2:end-1);

% M�ling 2
m2Y  = fft(a2);
m2P2 = abs(m2Y/L);
m2P1 = m2P2(1:L/2+1);
m2P1(2:end-1) = 2*m2P1(2:end-1);

m2Y_off  = fft(a2_off);
m2P2_off = abs(m2Y_off/L);
m2P1_off = m2P2_off(1:L/2+1);
m2P1_off(2:end-1) = 2*m2P1_off(2:end-1);

% M�ling 3
m3Y  = fft(a3);
m3P2 = abs(m3Y/L);
m3P1 = m3P2(1:L/2+1);
m3P1(2:end-1) = 2*m3P1(2:end-1);

m3Y_off  = fft(a3_off);
m3P2_off = abs(m3Y_off/L);
m3P1_off = m3P2_off(1:L/2+1);
m3P1_off(2:end-1) = 2*m3P1_off(2:end-1);

%% Accelerometer FFT
% M�ling 1
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

% M�ling 2

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

% M�ling 3

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

%% Plot EMG
figure('name','Ikke-offsetjusteret','numbertitle','off')
% M�ling 1
subplot(2,3,1)
plot(f,m1P1);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'M�ling 1';'Frekvensanalyse'})
subplot(2,3,4)
%plot(tid,a1);
axis([0 10 -0.001 0.002]);
xlabel('Tid (s)')
ylabel('Amplitude (V)')
title({'M�ling 1';'EMG-signal'})

% M�ling 2
subplot(2,3,2)
plot(f,m2P1);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'M�ling 2';'Frekvensanalyse'})
subplot(2,3,5)
plot(tid,a2);
axis([0 10 -0.001 0.002]);
xlabel('Tid (s)')
ylabel('Amplitude (V)')
title({'M�ling 2';'EMG-signal'})

% M�ling 3
subplot(2,3,3)
plot(f,m3P1);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'M�ling 3';'Frekvensanalyse'})
subplot(2,3,6)
plot(tid,a3);
axis([0 10 -0.001 0.002]);
xlabel('Tid (s)')
ylabel('Amplitude (V)')
title({'M�ling 3';'EMG-signal'})

% Offsetjusteret

figure('name','Offsetjusteret','numbertitle','off')
% M�ling 1
subplot(2,3,1)
plot(f,m1P1_off);
%semilogx(f,m1P1_off);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'M�ling 1';'Frekvensanalyse'})
subplot(2,3,4)
%plot(tid,a1_off);
axis([0 10 -0.001 0.002]);
xlabel('Tid (s)')
ylabel('Amplitude (V)')
title({'M�ling 1';'EMG-signal'})

% M�ling 2
subplot(2,3,2)
plot(f,m2P1_off);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'M�ling 2';'Frekvensanalyse'})
subplot(2,3,5)
plot(tid,a2_off);
axis([0 10 -0.001 0.002]);
xlabel('Tid (s)')
ylabel('Amplitude (V)')
title({'M�ling 2';'EMG-signal'})

% M�ling 3
subplot(2,3,3)
plot(f,m3P1_off);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'M�ling 3';'Frekvensanalyse'})
subplot(2,3,6)
plot(tid,a3_off);
axis([0 10 -0.001 0.002]);
xlabel('Tid (s)')
ylabel('Amplitude (V)')
title({'M�ling 3';'EMG-signal'})

m1Vmax = max(a1);
m1Vmin = min(a1);

m2Vmax = max(a2);
m2Vmin = min(a2);

m3Vmax = max(a3);
m3Vmin = min(a3);

%rms = rms(a(1:1000)) 

%% Plot ACC

% M�ling 1

figure('name','ACC m�ling 1','numbertitle','off')
subplot(2,3,1)
plot(f,m1P1acc1_x);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 1 - x-aksen';'Frekvensanalyse'})
subplot(2,3,2)
plot(f,m1P1acc1_y);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 1 - y-aksen';'Frekvensanalyse'})
subplot(2,3,3)
plot(f,m1P1acc1_z);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 1 - z-aksen';'Frekvensanalyse'})
subplot(2,3,4)
plot(f,m1P1acc2_x);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 2 - x-aksen';'Frekvensanalyse'})
subplot(2,3,5)
plot(f,m1P1acc2_y);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 2 - y-aksen';'Frekvensanalyse'})
subplot(2,3,6)
plot(f,m1P1acc2_z);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 2 - z-aksen';'Frekvensanalyse'})

% M�ling 2

figure('name','ACC m�ling 2','numbertitle','off')
subplot(2,3,1)
plot(f,m2P1acc1_x);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 1 - x-aksen';'Frekvensanalyse'})
subplot(2,3,2)
plot(f,m2P1acc1_y);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 1 - y-aksen';'Frekvensanalyse'})
subplot(2,3,3)
plot(f,m2P1acc1_z);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 1 - z-aksen';'Frekvensanalyse'})
subplot(2,3,4)
plot(f,m2P1acc2_x);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 2 - x-aksen';'Frekvensanalyse'})
subplot(2,3,5)
plot(f,m2P1acc2_y);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 2 - y-aksen';'Frekvensanalyse'})
subplot(2,3,6)
plot(f,m2P1acc2_z);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 2 - z-aksen';'Frekvensanalyse'})

% M�ling 3

figure('name','ACC m�ling 3','numbertitle','off')
subplot(2,3,1)
plot(f,m3P1acc1_x);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 1 - x-aksen';'Frekvensanalyse'})
subplot(2,3,2)
plot(f,m3P1acc1_y);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 1 - y-aksen';'Frekvensanalyse'})
subplot(2,3,3)
plot(f,m3P1acc1_z);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 1 - z-aksen';'Frekvensanalyse'})
subplot(2,3,4)
plot(f,m3P1acc2_x);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 2 - x-aksen';'Frekvensanalyse'})
subplot(2,3,5)
plot(f,m3P1acc2_y);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 2 - y-aksen';'Frekvensanalyse'})
subplot(2,3,6)
plot(f,m3P1acc2_z);
axis([0 60 0 2]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'Accelerometer 2 - z-aksen';'Frekvensanalyse'})
%%
figure
plot(f,m1P1_off);
%semilogx(f,m1P1_off);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
ylabel('St�rrelse')
title({'M�ling 1';'Frekvensanalyse'})
%% Filtrering

% Definer parameter til filter
% Wp = [50 500]/1000;     % Filter omr�der
% Ws = [30 900]/1000;     % Her slutter stopband
% Rp = 3;                 % Afvigelse i tvingninger i passband
% Rs = 5;                % Afvigelse i tvingninger i stopband
% -------------------------
%[n,Wn] = buttord(Wp,Ws,Rp,Rs);
%{
Wn = [15]/frekvens/2;
n=2;
[B,A]  = butter(n, Wn,'high'); %h�jpasfilter - v�lg rette kn�kfrekvens ([?]) og orden (n)
a_filt = filtfilt(B,A,a);

Wn = [400]/frekvens/2;
n=1;
[B,A]  = butter(n, Wn,'low'); %h�jpasfilter - v�lg rette kn�kfrekvens ([?]) og orden (n
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