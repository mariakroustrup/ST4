t = linspace(1,10,1000)
tempsinus=data(1:1000,1)
sinus=tempsinus*x;
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



