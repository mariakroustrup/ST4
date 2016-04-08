% Resultater
Baseline=load('Baseline1')
Nedogop=load('Nedogop1')

Fs=100;
N=1150
t=(0:N-1)/Fs;

%EMG m�lingerne v�lges
baseline=Baseline.data(7,:);
nedogop=Nedogop.data(7,:);

figure
hold on
plot(t, baseline(1:1150), 'g');
plot(t, nedogop([1:1150]), 'b');
xlim([0 10]);
xlabel('Tid [s]');
ylabel('Sp�nding [V]');
title('');
legend('Baseline', '2. m�ling')
set(gca,'fontsize',20);

%%



