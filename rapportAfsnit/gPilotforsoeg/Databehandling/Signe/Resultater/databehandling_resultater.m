%%  Resultater
% Plot af EMG baseline og EMG nedogop (Signe)
Baseline_emg=load('Baseline1');
Nedogop=load('Nedogop1');

Fs=100;
N=1150;
t=(0:N-1)/Fs;
samplelength = 10;
L  = samplelength*Fs;
f  = Fs*(0:(L/2))/L;

%EMG målingerne vælges
baseline=Baseline_emg.data(7,:);
nedogop_emg=Nedogop.data(7,:);

baseline_off = baseline-baseline(1);
nedogop_emg_off = nedogop_emg-nedogop_emg(1);

%Plot af Baseline med nedogop
figure('name','Ikke-offsetjusteret','numbertitle','off')
hold on
plot(t, baseline(1:1150), 'g');
plot(t, nedogop_emg([1:1150]), 'b');
xlim([0 10]);
xlabel('Tid [s]');
ylabel('Spænding [V]');
legend('Baseline', '2. måling')
set(gca,'fontsize',20);
box off

figure('name','Offsetjusteret','numbertitle','off')
hold on
plot(t, baseline_off(1:1150), 'g');
plot(t, nedogop_emg_off([1:1150]), 'b');
xlim([0 10]);
xlabel('Tid [s]');
ylabel('Spænding [V]');
legend('Baseline', '2. måling')
set(gca,'fontsize',20);
box off

%% Plot af frekvensanalyse (Baseline - Signe)
%load fft af baseline og nedogop.  Gemt variabel fra 'databehandling_signe_B'
% og 'databehandling_signe_NO'
m1P1_baseline_emg=load('m1P1_baseline');
m1P1_nedogop_emg=load('m1P1_nedogop');

% subplot af fft af Baseline og Nedogop
figure('name','Ikke-offsetjusteret','numbertitle','off')
subplot(2,1,1)
semilogy(f, m1P1_baseline_emg.m1P1)
% plot(f, m1P1_baseline_emg.m1P1);
%axis([-10 100 0 0.0008]);
% xlim([-0.5 12])
% ylim([-0.00005 0.0004])
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
xlim([10^-1 10^2])
title('Baseline måling')
set(gca,'fontsize',20);
box off

% Nedogop
subplot(2,1,2)
semilogy(f, m1P1_nedogop_emg.m1P1)
% plot(f, m1P1_nedogop_emg.m1P1);
% axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
xlim([10^-1 10^2])
ylim([0 3*10^-4])
ylabel('Størrelse')
title('2. måling')
set(gca,'fontsize',20);
box off

%% Plot af offsetjusteret frekvensanalyse (Baseline - Signe)
m1P1_baseline_emg_off=load('m1P1_baseline_off');
m1P1_nedogop_emg_off=load('m1P1_nedogop_off');

figure('name','Offsetjusteret','numbertitle','off')
subplot(1,3,2)
semilogy(f, m1P1_baseline_emg_off.m1P1_off)
% plot(f, m1P1_baseline_emg.m1P1);
%axis([-10 100 0 0.0008]);
% xlim([-0.5 12])
% ylim([-0.00005 0.0004])
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
xlim([0 50])
ylim([0 10e-4])
set(gca,'ytick',[0,0.001, 0.01, 1]*10e-4)
title('Stående Baseline')
set(gca,'fontsize',20);
box off
grid on

% Nedogop
subplot(1,3,3)
semilogy(f, m1P1_nedogop_emg_off.m1P1_off)
% plot(f, m1P1_nedogop_emg.m1P1);
% axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
xlim([0 50])
ylim([0 10e-4])
set(gca,'ytick',[0,0.001, 0.01, 1]*10e-4)
ylabel('Størrelse')
title('Squat-øvelsen')
set(gca,'fontsize',20);
box off
grid on

%figure('name','Ikke-offsetjusteret','numbertitle','off')
% Måling 1
subplot(1,3,1)
semilogy(f, m1P1_off)
xlim([0 50])
ylim([0 10e-4])
set(gca,'ytick',[0,0.001, 0.01, 1]*10e-4)
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
title('Siddende Baseline')
set(gca,'fontsize',20);
box off
grid on


%xlim([10^-1 10^2])

%%
figure
% Nedogop
subplot(1,2,1)
semilogy(f, m1P1_nedogop_emg_off.m1P1_off)
% plot(f, m1P1_nedogop_emg.m1P1);
% axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
xlim([0 50])
ylim([0 10e-4])
set(gca,'ytick',[0,0.001, 0.01, 1]*10e-4)
ylabel('Størrelse')
title('2. måling')
set(gca,'fontsize',20);
box off
grid on

temp2 = load('m1P1_beskaeret')
% Nedogop
subplot(1,2,2)
semilogy(f, temp2.m1P1)
% plot(f, m1P1_nedogop_emg.m1P1);
% axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)22')
xlim([0 50])
ylim([0 10e-4])
set(gca,'ytick',[0,0.001, 0.01, 1]*10e-4)
ylabel('Størrelse')
title('2. måling')
set(gca,'fontsize',20);
box off
grid on