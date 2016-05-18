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
% Plotter for f�rste maaling
figure
subplot(2,1,1)
plot(t, sinus, t, lowpass);
hold on
xlabel('Tid [s]')
ylabel('Sp�nding [V]')
xlim([0 10])
legend('Input sinussignal','Filtreret sinussignal');
set(gca,'fontsize',20);
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


figure
plot(t, grader);
hold on
xlabel('Tid [s]')
ylabel('Vinkel [\circ]')
xlim([0 10])
ylim([-120 180])
set(gca,'fontsize',20);
box off