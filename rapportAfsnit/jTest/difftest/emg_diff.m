load('diff_2.mat')
Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;

EMG=data(1:1000,1)/10000;
diff=data(1:1000,2);

ymax = 1200/1000;
ymin = 0;
imax = 4.8;
imin = 0;

ymax2 = 20;
ymin2 = -20;
imax2 = 4.8;
imin2 = 0;

figure
hold on
[hAx,hLine1,hLine2] = plotyy(t(1:1000), samlet, t(1:1000), data1);

plot(t(1:1000), EMG)
[ymax,imax,ymin,imin] = extrema(EMG)
hold on
plot(t(imax),ymax,'r*',t(imin),ymin,'g*');
ylim([-0.1 0.2])
ylabel('Spænding [V]')
yyaxis right
plot(t(1:1000), diff);
ylim([-20 20])
xlim([0 10])
set(gca,'Xtick',[0,0.001, 0.01, 1])
xlabel('Tid [s]')
legend('Input', 'Output')
set(gca,'fontsize',20);
box off