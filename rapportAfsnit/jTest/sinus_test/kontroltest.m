load('matlab')

t = linspace(1,10,1000)
tempsinus=data(1:1000,1)
sinus=tempsinus*(3.3/2048);
output=(data(1:1000,2))


figure
hold on
[hAx,hLine1,hLine2] = plotyy(t, sinus(1:1000), t, output(1:1000));
set(hAx(1),'fontsize',20);
set(hAx(2),'fontsize',20);
legend('Sinus signal','Output');

set(hAx(1),'XTick',[0:1:10]);
set(get(hAx(1),'Xlabel'),'string','Tid [s]');

set(hAx(1), 'YLim',[0 5]);
set(hAx(1),'YTick',[0:1:5]);
set(get(hAx(1),'Ylabel'),'string','Spænding [V]');

set(hAx(2), 'YLim',[-11 11]);
set(get(hAx(2),'Ylabel'),'string','Digitalt output');



figure
ymax = 10;
ymin = 0;
imax = 10;
imin = 0;

ymax2 = -10;
ymin2 = 0;
imax2 = 10;
imin2 = 0;
plot(t(1:1000), sinus(1:1000));
[ymax,imax,ymin,imin] = extrema(EMG)
hold on
plot(t(imax),ymax,'r*',t(imin),ymin,'g*')
%plot(t(1:1000), diff)
%[ymax2,imax2,ymin2,imin2] = extrema(diff);
%hold on
%plot(t(imax2),ymax2,'b*',t(imin2),ymin2,'y*')
%xlim([0 10])
%set(gca,'Xtick',[0,0.001, 0.01, 1])
% ylim([-400 1500])
% ylabel('Spænding [V]')
% xlabel('Tid [s]')
% legend('Input', 'Output')
% set(gca,'fontsize',20);
% box off

