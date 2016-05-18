%% Loader data
load('matlab.mat')

%% Data
tempsinus = data(800:1799,1);
sinus = tempsinus*(3.3/2^11);
templowpass = data(800:1799,2);
lowpass = templowpass*(3.3/2^11);
diff = data(800:1799,3);
grader = data(800:1799,4);
%% Definerer variable 
Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;

%% Plots
% Plotter for første maaling
figure
subplot(3,1,1)
plot(t, grader);
hold on
xlabel('Tid [s]')
ylabel('Grader [\circ]')
xlim([0 10])
set(gca,'XTick',[0:1:10])
ylim([-120 180])
set(gca,'YTick',[-120:40:180])
legend('Input','Output');
set(gca,'fontsize',20);
box off

subplot(3,1,2)
plot(t, sinus, t, lowpass);
hold on
xlabel('Tid [s]')
ylabel('EMG [V]')
xlim([0 10])
set(gca,'XTick',[0:1:10])
legend('Input','Output');
set(gca,'fontsize',20);
box off

subplot(3,1,3)
plot(t, diff);
hold on
xlabel('Tid [s]')
ylabel('Digtial output')
xlim([0 10])
set(gca,'XTick',[0:1:10])
ylim([-15 15])
set(gca,'fontsize',20);
box off