load('matlab.mat')
Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;

samlet=data(1:994,1)
data1=[data(1:994,2) data(1:994,3)]
roed=data(1:994,2)
groen=data(1:994,3)

figure
hold on
[hAx,hLine1,hLine2] = plotyy(t(1:994), samlet, t(1:994), data1);

set(hAx(1),'fontsize',20);
set(hAx(2),'fontsize',20);
legend('Vinkel','Accelerometer på femur','Accelerometer på tibia');

set(hAx(1), 'XLim',[0 10]);
set(hAx(1),'XTick',[0:1:10]);
set(get(hAx(1),'Xlabel'),'string','Tid [s]');

set(hAx(1), 'YLim',[0 200]);
set(hAx(1),'YTick',[0:20:200]);
set(get(hAx(1),'Ylabel'),'string','Knæets vinkel [\circ]');
box off

set(hAx(2), 'YLim',[-210 20]);
set(hAx(2),'YTick',[-210: 20: 20]);
set(get(hAx(2),'Ylabel'),'string','Accelerometre [V]');

