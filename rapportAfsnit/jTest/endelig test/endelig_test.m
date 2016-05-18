%% Loader data
load('matlab.mat')

%% Data
tempsinus = data(800:1799,1);
sinus = tempsinus*(3.3/2^11);
templowpass = data(800:1799,2);
lowpass = templowpass*(3.3/2^11);
diff = data(800:1799,3);
grader = data(800:1799,4);


sinuss = [sinus lowpass]
%% Definerer variable 
Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;

%% Plots
% Plotter for f�rste maaling
figure
subplot(2,1,1)
hold on
[hAx,hLine1,hLine2] = plotyy(t, sinuss, t, grader);
set(hAx(1),'fontsize',20);
set(hAx(2),'fontsize',20);
legend('Ufiltreret sinus','Filtreret sinus', 'Vinkel', 'Location', 'Southwest');

set(hAx(1), 'XLim',[0 10]);
set(hAx(1),'XTick',[0:1:10]);
set(get(hAx(1),'Xlabel'),'string','Tid [s]');

set(hAx(2), 'YLim',[-130 180]);
set(hAx(2),'YTick',[-130:30:180]);
set(get(hAx(2),'Ylabel'),'string','Vinkel [\circ]');

set(hAx(1), 'YLim',[1.35 1.45]);
set(hAx(1),'YTick',[1.35:0.01:1.45]);
set(get(hAx(1),'Ylabel'),'string','Sp�nding [V]');
box off

subplot(2,1,2)
plot(t, diff);
hold on
xlabel('Tid [s]')
ylabel('Sp�nding [V]')
legend('Digtialt output')
xlim([0 10])
ylim([-15 15])
set(gca,'fontsize',20);
box off


