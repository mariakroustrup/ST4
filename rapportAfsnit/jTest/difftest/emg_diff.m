load('emg_diff.mat')
Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;

EMG=data(100:600,1);
diff=data(100:600,2);

hold on
plot(t(1:501), EMG)
plot(t(1:501), diff)
xlim([0 5])
ylim([-20 1200])
ylabel('Spænding [V]')
xlabel('Tid [s]')
legend('Input', 'Output')
set(gca,'fontsize',20);
box off