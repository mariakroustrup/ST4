%% Loader data
maaling1 = load ('1maaling');
maaling2 = load ('2maaling');
maaling3 = load ('3maaling');
maaling4 = load ('4maaling');

%% Definerer variable 
Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
%% Deler dataen op
% maaling1:
EMG11 = (maaling1.data (:,1));
Acc1 = (maaling1.data (:,3));
Dif1 = (maaling1.data (:,2));

% maaling2:
EMG22 = (maaling2.data (:,3));
Acc2 = (maaling2.data (:,2));
Dif2 = (maaling2.data (:,1));

% maaaling3:
EMG33 = (maaling3.data (:,1));
Acc3 = (maaling3.data (:,3));
Dif3 = (maaling3.data (:,2));

% maaling 4:
EMG44 = (maaling4.data (:,1));
Acc4 = (maaling4.data (:,3));
Dif4 = (maaling4.data (:,2));

%% Ligger spændingen divideret med ADC'ens arbejdsområde til dataen
EMG1 = EMG11 * (3.3/2048) 
EMG2 = EMG22 * (3.3/2048) 
EMG3 = EMG33 * (3.3/2048) 
EMG4 = EMG44 * (3.3/2048) 

%% Plots
% Plotter for første maaling
figure
subplot(2,1,1)
hold on
[hAx,hLine1,hLine2] = plotyy(t, EMG1, t, Acc1);
set(hAx(1),'fontsize',20);
set(hAx(2),'fontsize',20);
legend('EMG','Vinkel');

set(hAx(1), 'XLim',[0 10]);
set(hAx(1),'XTick',[0:1:10]);
set(get(hAx(1),'Xlabel'),'string','Tid [s]');

set(hAx(2), 'YLim',[-420 180]);
set(hAx(2),'YTick',[-420:40:180]);
set(get(hAx(2),'Ylabel'),'string','Knæets vinkel [\circ]');

set(hAx(1), 'YLim',[-0.5 1.5]);
set(hAx(1),'YTick',[-0.5:0.2:1.5]);
set(get(hAx(1),'Ylabel'),'string','EMG [V]');
box off

subplot(2,1,2)
plot(t,Dif1);
hold on
xlabel('Tid [s]')
ylabel('Digital output')
xlim([0 10])
set(gca,'XTick',[0:1:10])
ylim([-15 15])
set(gca,'fontsize',20);
box off

% %%
% EMG112 = (maaling1.data (:,1))*(3.3/2^11);
% plot(t,EMG112);
% xlabel('Tid [s]')
% set(gca,'XTick',[0:1:10])
% ylabel('EMG [V]')
% set(gca,'YTick',[-0.5:0.2:2.1])
% set(gca,'fontsize',20);
% box off
% 
% %% Test af vinkler - Der viser at -200 og -400 grader virker
% plot(t,Acc2)
% xlabel('Tid [s]')
% ylabel('Knæets vinkel [\circ]')
% xlim([0 10])
% set(gca,'XTick',[0:1:10])
% ylim([-450 200])
% set(gca,'YTick',[-450:50:200])
% set(gca,'fontsize',20);
% box off


% % Plotter for anden maaling
% figure
% subplot(2,1,1)
% hold on
% [hAx,hLine1,hLine2] = plotyy(t, EMG2, t, Acc2);
% set(hAx(1),'fontsize',20);
% set(hAx(2),'fontsize',20);
% legend('EMG','Vinkel');
% 
% set(hAx(1), 'XLim',[0 10]);
% set(hAx(1),'XTick',[0:1:10]);
% set(get(hAx(1),'Xlabel'),'string','Tid [s]');
% 
% set(hAx(2), 'YLim',[0 250]);
% set(hAx(2),'YTick',[0:20:250]);
% set(get(hAx(2),'Ylabel'),'string','Vinkel [\circ]');
% 
% set(hAx(1), 'YLim',[-0.5 1.8]);
% set(hAx(1),'YTick',[-0.5:0.2:2]);
% set(get(hAx(1),'Ylabel'),'string','Spænding [V]');
% box off
% 
% subplot(2,1,2)
% plot(t,Dif2);
% hold on
% xlabel('Tid [s]')
% ylabel('Digtialt output')
% legend('EMG-algoritme')
% xlim([0 10])
% ylim([-15 15])
% set(gca,'fontsize',20);
% box off
% 
% % Plotter for tredje maaling
% figure
% subplot(2,1,1)
% hold on
% [hAx,hLine1,hLine2] = plotyy(t, EMG3, t, Acc4);
% set(hAx(1),'fontsize',20);
% set(hAx(2),'fontsize',20);
% legend('EMG','Vinkel');
% 
% set(hAx(1), 'XLim',[0 10]);
% set(hAx(1),'XTick',[0:1:10]);
% set(get(hAx(1),'Xlabel'),'string','Tid [s]');
% 
% set(hAx(2), 'YLim',[0 250]);
% set(hAx(2),'YTick',[0:20:250]);
% set(get(hAx(2),'Ylabel'),'string','Vinkel [\circ]');
% 
% set(hAx(1), 'YLim',[-0.5 1.8]);
% set(hAx(1),'YTick',[-0.5:0.2:2]);
% set(get(hAx(1),'Ylabel'),'string','Spænding [V]');
% box off
% 
% subplot(2,1,2)
% plot(t,Dif3);
% hold on
% xlabel('Tid [s]')
% ylabel('Digtialt output')
% legend('EMG-algoritme')
% xlim([0 10])
% ylim([-15 15])
% set(gca,'fontsize',20);
% box off
%  
% % Plotter for fjerde maaling
% figure
% subplot(2,1,1)
% hold on
% [hAx,hLine1,hLine2] = plotyy(t, EMG4, t, Acc3);
% set(hAx(1),'fontsize',20);
% set(hAx(2),'fontsize',20);
% legend('EMG','Vinkel');
% 
% set(hAx(1), 'XLim',[0 10]);
% set(hAx(1),'XTick',[0:1:10]);
% set(get(hAx(1),'Xlabel'),'string','Tid [s]');
% 
% set(hAx(2), 'YLim',[0 250]);
% set(hAx(2),'YTick',[0:20:250]);
% set(get(hAx(2),'Ylabel'),'string','Vinkel [\circ]');
% 
% set(hAx(1), 'YLim',[-0.5 1.8]);
% set(hAx(1),'YTick',[-0.5:0.2:2]);
% set(get(hAx(1),'Ylabel'),'string','Spænding [V]');
% box off
% 
% subplot(2,1,2)
% plot(t,Dif4);
% hold on
% xlabel('Tid [s]')
% ylabel('Digtialt output')
% legend('EMG-algoritme')
% xlim([0 10])
% ylim([-15 15])
% set(gca,'fontsize',20);
% box off