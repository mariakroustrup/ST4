clear all

Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;

%% loader data
load('nedogop_emg')
Nedogop = load('Nedogop1');

% R�d accelerometer
load('roedY0.mat')
load('roedY20.mat')
load('roedY40.mat')
load('roedY60.mat')
load('roedY80.mat')
load('roedY90.mat')

% Gr�n accelerometer
load('groenY90.mat')
load('groenY100.mat')
load('groenY120.mat')
load('groenY140.mat')
load('groenY160.mat')
load('groenY180.mat')

%% Det r�de accelerometer

% Accelerometer 1: P� nuv�rende tidspunkt benytter vi kun Nedogop2/Y-aksen
Nedogop1 = (Nedogop.data (1,:));
Nedogop2 = (Nedogop.data (2,:));
Nedogop3 = (Nedogop.data (3,:));

%Fjerner offset fra m�ling Y, samt g�r v�rdierne negative
Nedogop2_off=-abs(Nedogop2-Nedogop2(1));

% Fjerne offset fra roedY
roedY0o=roedY0-roedY0;
roedY20o=roedY0-roedY20;
roedY40o=roedY0-roedY40;
roedY60o=roedY0-roedY60;
roedY80o=roedY0-roedY80;
roedY90o=roedY0-roedY90;


%% Gr�n accelerometer
Nedogop4 = (Nedogop.data (4,:));
Nedogop5 = (Nedogop.data (5,:));
Nedogop6 = (Nedogop.data (6,:));

%Fjerner offset fra m�ling Y samt tager kun positive v�rdier
Nedogop5_off=abs(Nedogop5-Nedogop5(1));

% Fjerne offset fra groenY
groenY90o=groenY180-groenY90;
groenY100o=groenY180-groenY100;
groenY120o=groenY180-groenY120;
groenY140o=groenY180-groenY140;
groenY160o=groenY180-groenY160;
groenY180o=groenY180-groenY180;

% Nedogop_emg offset
Nedogop_emgo=nedogop_emg-nedogop_emg(1);

%% Grader fra Lego for r�d
for ii= 1:1170 ;
    degreer(ii) = funktionr(Nedogop2_off(ii));
end;

%% Grader fra Lego for gr�n

for ii= 1:1170 ;
    degreeg(ii) = funktiong(Nedogop5_off(ii));
end;

%% De samlede grader

for ii=1:1170;
    grader(ii)=degreeg(ii)+degreer(ii);
end  ;

%% Halvdelen af graderne

for ii=1:529;
    grader1(ii)=degreeg(ii)+degreer(ii);
end ;

%% Plots
% Plot af grader i forhold til tid
temp = grader(1:1000);
temp = -temp;
temp = temp+180;

figure
%plot(t, grader(1:1000)+90);
plot(t, temp);
xlabel('Tid [s]')
ylabel('Kn�ets vinkel [\circ]')
set(gca,'XTick',[0:1:10])
ylim([90 180])
set(gca,'YTick',[90:10:180])
set(gca,'fontsize',20);
box off 

% Plot af EMG og accelerometer med to y akser
figure
hold on
%[hAx,hLine1,hLine2] = plotyy(t, Nedogop_emgo(1:1000), t, grader(1:1000));
[hAx,hLine1,hLine2] = plotyy(t, Nedogop_emgo(1:1000), t, temp);
set(hAx(1),'fontsize',20);
set(hAx(2),'fontsize',20);
legend('EMG','Vinkel');

set(hAx(1), 'XLim',[0 10]);
set(hAx(1),'XTick',[0:1:10]);
set(get(hAx(1),'Xlabel'),'string','Tid [s]');

set(hAx(2), 'YLim',[90 180]);
set(hAx(2),'YTick',[90:10:180]);
set(get(hAx(2),'Ylabel'),'string','Kn�ets vinkel [\circ]');

set(hAx(1), 'YLim',[-0.1 1]);
set(hAx(1),'YTick',[0:0.1:1]);
set(get(hAx(1),'Ylabel'),'string','EMG [V]');
box off

%% Deler vores data op
Nedogop2 = Nedogop_emgo(1:529);
Nedogop3 = Nedogop_emgo(530:1058);

Nedogop2s = smooth(Nedogop2,20);

Nedogop3f = flip(Nedogop3);
Nedogop3s = smooth(Nedogop3f,20);

%% Plot af EMG med grader og sp�nding

figure
plot(grader1, Nedogop2s, 'r');
hold on 
plot(grader1, Nedogop3s, 'g');
title ('20')
xlabel('Vinkel [\circ]')
ylabel('Sp�nding [V]')
legend('Fleksion af kn�et', 'Ekstension af kn�et', 'Location','northwest')
xlim([0 80])
ylim([0 0.8])
set(gca,'fontsize',20);
box off
 
Nedogop21s = smooth(Nedogop2,30);

Nedogop3f = flip(Nedogop3);
Nedogop31s = smooth(Nedogop3f,30);
figure
plot(grader1, Nedogop21s, 'r');
hold on 
plot(grader1, Nedogop31s, 'g');
title ('30')
xlabel('Vinkel [\circ]')
ylabel('Sp�nding [V]')
legend('Fleksion af kn�et', 'Ekstension af kn�et', 'Location','northwest')
xlim([0 80])
ylim([0 0.8])
set(gca,'fontsize',20);
box off

Nedogop22s = smooth(Nedogop2,40);

Nedogop3f = flip(Nedogop3);
Nedogop32s = smooth(Nedogop3f,40);

figure
plot(grader1, Nedogop22s, 'r');
hold on 
plot(grader1, Nedogop32s, 'g');
title ('40')
xlabel('Vinkel [\circ]')
ylabel('Sp�nding [V]')
legend('Fleksion af kn�et', 'Ekstension af kn�et', 'Location','northwest')
xlim([0 80])
ylim([0 0.8])
set(gca,'fontsize',20);
box off

%%

Nedogop23s = smooth(Nedogop2(1:5:end),10);

Nedogop3f = flip(Nedogop3);
Nedogop33s = smooth(Nedogop3f(1:5:end),10);

figure
plot(grader1(1:5:529), Nedogop23s, 'r');
hold on 
plot(grader1(1:5:529), Nedogop33s, 'g');
title ('')
xlabel('Vinkel [\circ]')
ylabel('EMG [V]')
legend('Fleksion af kn�et', 'Ekstension af kn�et', 'Location','northwest')
xlim([0 80])
ylim([0 0.8])
set(gca,'fontsize',20);
box off


