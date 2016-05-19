Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;

load('matlab.mat')
data=data*(3.3/2^11);
plot(t,data)
xlabel('Tid [s]');
set(gca,'XTick',[0:1:10])
ylabel('EMG [V]')
ylim([-0.06 0.16])
set(gca,'YTick',[-0.06:0.02:0.16])
set(gca,'fontsize',20);
box off