clear all

Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;

%% loader data
load('nedogop_emg')
Nedogop = load('Nedogop1');

% Rød accelerometer
load('roedY0.mat')
load('roedY20.mat')
load('roedY40.mat')
load('roedY60.mat')
load('roedY80.mat')
load('roedY90.mat')

% Grøn accelerometer
load('groenY90.mat')
load('groenY100.mat')
load('groenY120.mat')
load('groenY140.mat')
load('groenY160.mat')
load('groenY180.mat')

%% Det røde accelerometer

% Accelerometer 1: På nuværende tidspunkt benytter vi kun Nedogop2/Y-aksen
Nedogop1 = (Nedogop.data (1,:));
Nedogop2 = (Nedogop.data (2,:));
Nedogop3 = (Nedogop.data (3,:));

%Fjerner offset fra måling Y, samt gør værdierne negative
Nedogop2_off=-abs(Nedogop2-Nedogop2(1));

% Fjerne offset fra roedY
roedY0o=roedY0-roedY0;
roedY20o=roedY0-roedY20;
roedY40o=roedY0-roedY40;
roedY60o=roedY0-roedY60;
roedY80o=roedY0-roedY80;
roedY90o=roedY0-roedY90;


%% Grøn accelerometer
Nedogop4 = (Nedogop.data (4,:));
Nedogop5 = (Nedogop.data (5,:));
Nedogop6 = (Nedogop.data (6,:));

%Fjerner offset fra måling Y samt tager kun positive værdier
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

%% Grader fra Lego for rød
for ii= 1:1170 ;
    degreer(ii) = funktionr(Nedogop2_off(ii));
end

%% Grader fra Lego for grøn

for ii= 1:1170 ;
    degreeg(ii) = funktiong(Nedogop5_off(ii));
end

%% De samlede grader

for ii=1:1170;
    grader(ii)=degreeg(ii)+degreer(ii);
end  

%% Plots
% Plot af grader i forhold til tid
figure
plot(t, grader(1:1000));
xlabel('Tid [s]')
ylabel('Vinkel [\circ]')
set(gca,'XTick',[0:1:10])
ylim([0 90])
set(gca,'YTick',[0:10:90])
set(gca,'fontsize',20);

% Plot af EMG og accelerometer med to y akser
figure
hold on
[hAx,hLine1,hLine2] = plotyy(t, Nedogop_emgo(1:1000), t, grader(1:1000))
set(hAx(1),'fontsize',20);
set(hAx(2),'fontsize',20);
legend('EMG','Vinkel')

set(hAx(1), 'XLim',[0 10])
set(hAx(1),'XTick',[0:1:10])
set(get(hAx(1),'Xlabel'),'string','Tid [s]')

set(hAx(2), 'YLim',[0 90])
set(hAx(2),'YTick',[0:10:90])
set(get(hAx(2),'Ylabel'),'string','Vinkel [\circ]')

set(hAx(1), 'YLim',[-0.1 1])
set(hAx(1),'YTick',[0:0.1:1])
set(get(hAx(1),'Ylabel'),'string','Spænding [V]')

% Plot af EMG med grader og spænding
figure
plot(grader, nedogop_emg)
xlabel('Vinkel [\circ]')
ylabel('Spænding [V]')
xlim([0 180])
set(gca,'XTick',[0:10:80])



