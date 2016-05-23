%% Filterkonfigurationer
frekvens = 100;

% 1. mulighed
Wn = [5]/frekvens/2
n = 1;

[b,a]  = butter(n, Wn,'low');

a_filt = filtfilt(b,a,nedogop_emg_off);

% 2. mulighed
Wn1 = [5]/frekvens/2;
n1 = 2;

[b1,a1]  = butter(n1, Wn1,'low')

a_filt1 = filtfilt(b1,a1,nedogop_emg_off);

% 3. mulighed
Wn2 = [5]/frekvens/2
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
subplot(2,3,1)
hold on
plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
plot(t, a_filt(1:1150),'LineWidth',1.5);
xlim([0 10]);
set(gca, 'XTick', [0:2.5:10])
%xlabel('Tid [s]');
ylabel('EMG [V]');
%legend('Ufiltreret', 'Filtreret')
set(gca,'fontsize',20);
title('1. orden')
%title('1 Hz knækfrekvens')
box off

subplot(2,3,2)
hold on
plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
plot(t, a_filt1(1:1150),'LineWidth',1.5);
xlim([0 10]);
set(gca, 'XTick', [0:2.5:10])
xlabel('Tid [s]');
%ylabel('Spænding [V]');
%legend('Ufiltreret', 'Filtreret')
set(gca,'fontsize',20);
title('2. orden')
%title('1.26 Hz knækfrekvens')
box off

subplot(2,3,3)
hold on
plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
plot(t, a_filt2(1:1150),'LineWidth',1.5);
xlim([0 10]);
set(gca, 'XTick', [0:2.5:10])
%xlabel('Tid [s]');
%ylabel('Spænding [V]');
%legend('Ufiltreret', 'Filtreret')
set(gca,'fontsize',20);
title('3. orden')
%title('3 Hz knækfrekvens')
box off

subplot(2,3,4)
hold on
plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
plot(t, a_filt(1:1150),'LineWidth',1.5);
xlim([4.2 6]);
ylim([0.5 0.75]);
%xlabel('Tid [s]');
ylabel('EMG [V]');
%legend('Ufiltreret', 'Filtreret')
set(gca,'fontsize',20);
title('1. orden')
%title('1 Hz knækfrekvens')
box off

subplot(2,3,5)
hold on
plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
plot(t, a_filt1(1:1150),'LineWidth',1.5);
xlim([4.2 6]);
ylim([0.5 0.75]);
xlabel('Tid [s]');
%ylabel('Spænding [V]');
%legend('Ufiltreret', 'Filtreret')
set(gca,'fontsize',20);
title('2. orden')
%title('1,26 Hz knækfrekvens')
box off

subplot(2,3,6)
hold on
plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
plot(t, a_filt2(1:1150),'LineWidth',1.5);
xlim([4.2 6]);
ylim([0.5 0.75]);
%xlabel('Tid [s]');
%ylabel('Spænding [V]');
%legend('Ufiltreret', 'Filtreret')
set(gca,'fontsize',20);
title('3. orden')
%title('3 Hz knækfrekvens')
box off

heigth = 20;
width = 35;

set(h,'Units','centimeters');
set(h,'Position',[1 1 width heigth]);
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
saveas(h, 'lavpas_orden', 'pdf')

% h1 = figure;
% subplot(3,1,1)
% hold on
% plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
% plot(t, a_filt(1:1150),'LineWidth',1.5);
% xlim([0 10]);
% %xlabel('Tid [s]');
% %ylabel('Spænding [V]');
% %legend('Ufiltreret', 'Filtreret')
% set(gca,'fontsize',20);
% title('15 Hz knækfrekvens')
% box off
% 
% subplot(3,1,2)
% hold on
% plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
% plot(t, a_filt1(1:1150),'LineWidth',1.5);
% xlim([0 10]);
% xlabel('Tid [s]');
% ylabel('Spænding [V]');
% %legend('Ufiltreret', 'Filtreret')
% set(gca,'fontsize',20);
% title('20 Hz knækfrekvens')
% box off
% 
% subplot(3,1,3)
% hold on
% plot(t, nedogop_emg_off([1:1150]),'LineWidth',1.5);
% plot(t, a_filt2(1:1150),'LineWidth',1.5);
% xlim([0 10]);
% %xlabel('Tid [s]');
% %ylabel('Spænding [V]');
% %legend('Ufiltreret', 'Filtreret')
% set(gca,'fontsize',20);
% title('25 Hz knækfrekvens')
% box off
% 
% heigth1 = 40;
% width1 = 20;
% 
% set(h1,'Units','centimeters');
% set(h1,'Position',[1 1 width1 heigth1]);
% pos = get(h,'Position');
% set(h1,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])


figure
hold on
plot(f, m1P1_off,'b')
plot(f, m2P1_off,'g')
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
legend('Ufiltreret','Filtreret')
set(gca,'fontsize',20);
box off