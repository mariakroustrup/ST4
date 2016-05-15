load('diff_2.mat')
Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;

EMG=data(1:1000,1);
diff=data(1:1000,2);

ymax = 1200;
ymin = 0;
imax = 4.8;
imin = 0;

ymax2 = 20;
ymin2 = -20;
imax2 = 4.8;
imin2 = 0;

hold on
plot(t(1:1000), EMG)
%[ymax,imax,ymin,imin] = extrema(EMG)
%hold on
%plot(t(imax),ymax,'r*',t(imin),ymin,'g*')
plot(t(1:1000), diff)
%[ymax2,imax2,ymin2,imin2] = extrema(diff);
%hold on
%plot(t(imax2),ymax2,'b*',t(imin2),ymin2,'y*')
xlim([0 10])
%set(gca,'Xtick',[0,0.001, 0.01, 1])
ylim([-400 1500])
ylabel('Spænding [V]')
xlabel('Tid [s]')
legend('Input', 'Output')
set(gca,'fontsize',20);
box off