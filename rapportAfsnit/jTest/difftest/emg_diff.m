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
[hAx,hLine1,hLine2] = plotyy(t(1:1000), EMG, t(1:1000), diff);

plot(t(1:1000), EMG)
[ymax,imax,ymin,imin] = extrema(EMG)
hold on
plot(t(imax),ymax,'r*',t(imin),ymin,'g*');

set(hAx(1),'fontsize',20);
set(hAx(2),'fontsize',20);
legend('Input','Output');

set(hAx(1), 'XLim',[0 10]);
set(hAx(1),'XTick',[0:0.01:10]);
set(get(hAx(1),'Xlabel'),'string','Tid [s]');

set(hAx(1), 'YLim',[-0.1 0.2]);
set(hAx(1),'YTick',[-0.1:0.05:0.2]);
set(get(hAx(1),'Ylabel'),'string','Sp�nding [V]');
box off

set(hAx(2), 'YLim',[-20 20]);
set(hAx(2),'YTick',[-20: 5: 20]);
set(get(hAx(2),'Ylabel'),'string','Digitalt output');

%ylim([-0.1 0.2])
%ylabel('Digitalt output')
%yyaxis right
%plot(t(1:1000), diff);
%ylim([-20 20])
%xlim([0 10])
%set(gca,'Xtick',[0,0.001, 0.01, 1])
%xlabel('Tid [s]')
%legend('Input', 'Output')
%set(gca,'fontsize',20);
box off