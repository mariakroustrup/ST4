%%  Resultater
% Plot af EMG baseline og EMG nedogop (Signe)
Baseline_emg=load('Baseline1')
Nedogop=load('Nedogop1')

Fs=100;
N=1150
t=(0:N-1)/Fs;

%EMG målingerne vælges
baseline=Baseline_emg.data(7,:);
nedogop_emg=Nedogop.data(7,:);

figure
hold on
plot(t, baseline(1:1150), 'g');
plot(t, nedogop_emg([1:1150]), 'b');
xlim([0 10]);
xlabel('Tid [s]');
ylabel('Spænding [V]');
title('');
legend('Baseline', '2. måling')
set(gca,'fontsize',20);

%% Plot af frekvensanalyse (Basline - Signe)
m1P1_baseline_emg=load('m1P1_baseline')
m1P1_nedogop_emg=load('m1P1_nedogop')
load('f')

figure
subplot(2,1,1)
plot(f, m1P1_baseline_emg.m1P1);
axis([-10 100 0 0.0008]);
xlim([-0.5 12])
ylim([-0.00005 0.0004])
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
title('Baseline måling')
set(gca,'fontsize',20);

% Plot af frekvensanalyse (Nedogop - Signe)
subplot(2,1,2)
plot(f, m1P1_nedogop_emg.m1P1);
axis([-10 100 0 0.0008]);
xlabel('Frekvens (Hz)')
xlim([-0.5 12])
ylim([-0.00005 0.0004])
ylabel('Størrelse')
title('2. måling')
set(gca,'fontsize',20);

%% Plot accelerometer og EMG
load('acc3')
load('acc4')

acc2f=flip(acc4);

acc= [acc3 acc2f] 

figure % new figure
hold on
[hAx,hLine1,hLine2] = plotyy(t(1:1150), nedogop_emg(1:1150), t(1:1150), acc(1:1150))
set(hAx(1),'fontsize',20);
set(hAx(2),'fontsize',20);

set(hAx(1), 'XLim',[0 11.5])
set(hAx(1),'XTick',[0:1:11])
set(get(hAx(1),'Xlabel'),'string','Tid [s]')

set(hAx(2), 'YLim',[-60 5])
set(hAx(2),'YTick',[-60:5:5])
set(get(hAx(2),'Ylabel'),'string','Vinkel [\circ]')

set(hAx(1), 'YLim',[-0.6 0.4])
set(hAx(1),'YTick',[-0.6:0.1:0.4])
set(get(hAx(1),'Ylabel'),'string','Spænding [V]')





