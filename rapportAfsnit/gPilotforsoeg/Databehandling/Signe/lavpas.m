%% Filterkonfigurationer
frekvens = 100;

% 1. mulighed
Wn = [15]/frekvens/2;
n = 1;

[b,a]  = butter(n, Wn,'low');

a_filt = filtfilt(b,a,nedogop_emg_off);

% 2. mulighed
Wn1 = [20]/frekvens/2;
n1 = 2;

[b1,a1]  = butter(n1, Wn1,'low')

a_filt1 = filtfilt(b1,a1,nedogop_emg_off);

Wn2 = [25]/frekvens/2;
n2 = 3;

[b2,a2]  = butter(n2, Wn2,'low');

a_filt2 = filtfilt(b2,a2,nedogop_emg_off);

%% Frekvensanalyse

m1Y_off  = fft(nedogop_emg_off);
m1P2_off = abs(m1Y_off/L);
m1P1_off = m1P2_off(1:L/2+1);
m1P1_off(2:end-1) = 2*m1P1_off(2:end-1);

m2Y_off  = fft(a_filt);
m2P2_off = abs(m2Y_off/L);
m2P1_off = m2P2_off(1:L/2+1);
m2P1_off(2:end-1) = 2*m2P1_off(2:end-1);

m2Y_off1  = fft(a_filt1);
m2P2_off1 = abs(m2Y_off1/L);
m2P1_off1 = m2P2_off1(1:L/2+1);
m2P1_off1(2:end-1) = 2*m2P1_off1(2:end-1);

m2Y_off2  = fft(a_filt2);
m2P2_off2 = abs(m2Y_off2/L);
m2P1_off2 = m2P2_off2(1:L/2+1);
m2P1_off2(2:end-1) = 2*m2P1_off2(2:end-1);

%% Plots
h = figure;
subplot(1,3,1)
hold on
plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
plot(t, a_filt(1:1150),'LineWidth',1.5);
xlim([0 10]);
%xlabel('Tid [s]');
ylabel('Spænding [V]');
%legend('Ufiltreret', 'Filtreret')
set(gca,'fontsize',20);
title('15 Hz knækfrekvens')
box off

subplot(1,3,2)
hold on
plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
plot(t, a_filt1(1:1150),'LineWidth',1.5);
xlim([0 10]);
xlabel('Tid [s]');
%ylabel('Spænding [V]');
%legend('Ufiltreret', 'Filtreret')
set(gca,'fontsize',20);
title('20 Hz knækfrekvens')
box off

subplot(1,3,3)
hold on
plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
plot(t, a_filt2(1:1150),'LineWidth',1.5);
xlim([0 10]);
%xlabel('Tid [s]');
%ylabel('Spænding [V]');
%legend('Ufiltreret', 'Filtreret')
set(gca,'fontsize',20);
title('25 Hz knækfrekvens')
box off

heigth = 10;
width = 35;

set(h,'Units','centimeters');
set(h,'Position',[1 1 width heigth]);
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
%print(h,'lavpas_knaek','-dpdf')


figure
hold on
plot(f, m1P1_off,'b')
plot(f, m2P1_off,'g')
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
legend('Ufiltreret','Filtreret')
set(gca,'fontsize',20);
box off