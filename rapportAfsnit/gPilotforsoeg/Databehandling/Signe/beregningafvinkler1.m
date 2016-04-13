clear all

Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
tid = (0:1170-1)*T
f = Fs*(0:(L/2))/L; 

%% loader data
load('nedogop_emg')

Nedogop = load('Nedogop1');
load('groenY0.mat')
load('groenY20.mat')
load('groenY40.mat')
load('groenY60.mat')
load('groenY80.mat')
load('groenY90.mat')
load('groenY100.mat')
load('groenY120.mat')
load('groenY140.mat')
load('groenY160.mat')
load('groenY180.mat')

load('roedY0.mat')
load('roedY20.mat')
load('roedY40.mat')
load('roedY60.mat')
load('roedY80.mat')
load('roedY90.mat')
load('roedY100.mat')
load('roedY120.mat')
load('roedY140.mat')
load('roedY160.mat')
load('roedY180.mat')
%% For beregning af offsetværdien:

% Accelerometer 1:
Nedogop1 = (Nedogop.data (1,:));
Nedogop2 = (Nedogop.data (2,:));
Nedogop3 = (Nedogop.data (3,:));

% Beregner mean
Nedogopmean1 = mean(Nedogop1)
Nedogopmean2 = mean(Nedogop2)
Nedogopmean3 = mean(Nedogop3)

% Beregner afvigelse
Nedogop1afv = ((Nedogopmean1-1.7)/1.7)
Nedogop2afv = ((Nedogopmean2-1.7)/1.7)
Nedogop3afv = ((Nedogopmean3-1.7)/1.7)

% Beregner offset
Offset1 = Nedogopmean1-Nedogop1afv
Offset3 = Nedogopmean3-Nedogop3afv
Offset2 = Nedogopmean2-Nedogop2afv

Offset11= (Offset1+Offset3)/2


% Beregner påvirkning i 1 g
 
Paavirk1=Nedogopmean2-Nedogop2afv

Sensi1=Paavirk1-Offset11;

%Fjerner offset fra måling Y
Nedogop2_off=-abs(Nedogop2-Nedogop2(1))

% Fjerne offset fra roedY
roedY0o=roedY0-roedY0
roedY20o=roedY0-roedY20
roedY40o=roedY0-roedY40
roedY60o=roedY0-roedY60
roedY80o=roedY0-roedY80
roedY90o=roedY0-roedY90

% roedY90o=roedY90-roedY90
% roedY100o=-roedY90+roedY100
% roedY120o=-roedY90+roedY120
% roedY140o=-roedY90+roedY140
% roedY160o=-roedY90+roedY160
% roedY180o=-roedY90+roedY180


%% Accelerometer 2
Nedogop4 = (Nedogop.data (4,:));
Nedogop5 = (Nedogop.data (5,:));
Nedogop6 = (Nedogop.data (6,:));

% Beregner mean
Nedogopmean4 = mean(Nedogop4)
Nedogopmean5 = mean(Nedogop5)
Nedogopmean6 = mean(Nedogop6)

% Beregner afvigelse
Nedogop4afv = ((Nedogopmean4-1.7)/1.7)
Nedogop5afv = ((Nedogopmean5-1.7)/1.7)
Nedogop6afv = ((Nedogopmean6-1.7)/1.7)

% Beregner offset
Offset4 = Nedogopmean4-Nedogop4afv
Offset6 = Nedogopmean6-Nedogop6afv
Offset5 = Nedogopmean5-Nedogop5afv
Offset22= (Offset4+Offset6)/2


% Beregner påvirkning i 1 g
Paavirk2=Nedogopmean5-Nedogop5afv

Sensi2=Paavirk2-Offset22;

%Fjerner offset fra måling Y
Nedogop5_off=abs(Nedogop5-Nedogop5(1))


% Fjerne offset fra groenY
groenY90o=groenY180-groenY90
groenY100o=groenY180-groenY100
groenY120o=groenY180-groenY120
groenY140o=groenY180-groenY140
groenY160o=groenY180-groenY160
groenY180o=groenY180-groenY180

% Nedogop_emg offset
Nedogop_emgo=nedogop_emg-nedogop_emg(1);

%% Grader fra Lego for grøn

for ii= 1:1170 
    degree(ii) = funktion(Nedogop5_off(ii));
end


%% Grader fra Lego for rød
for ii= 1:1170 
    degreer(ii) = funktionr(Nedogop2_off(ii));
end

for ii=1:1170
    grader(ii)=degree(ii)+degreer(ii);
end  


%% Plots!
figure
plot(t,grader(1:1000));
xlabel('Tid [s]')
ylabel('Vinkel [\circ]')
set(gca,'XTick',[0:1:10])
ylim([0 90])
set(gca,'YTick',[0:10:90])
set(gca,'fontsize',20);

% Emg og grader
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


% Plot af emg med grader og spænding
figure
plot(grader, nedogop_emg)
xlabel('Vinkel [\circ]')
ylabel('Spænding [V]')
xlim([0 90])
set(gca,'XTick',[0:10:90])



