dd =  load('Nedogop1.mat');
x = dd.data(1,:);
clear dd
xx = 1/20;
a = 1;
b = [xx xx xx xx xx xx xx xx xx xx xx xx xx xx xx xx xx xx xx xx];
y = filter(b,a,x);
t = 1:length(x)

figure
plot(t,x,t,y,'r')
ylim([1.4 1.65])
grid on

%%
load count.dat
a = 1;
b = [1/17 1/17 1/17 1/17 1/17 1/17 1/17 1/17 1/17 1/17 1/17 1/17 1/17 1/17 1/17 1/17 1/17];

x = count(:,1);
y = filter(b,a,x);

figure 
t = 1:length(x);
plot(t,x,'--',t,y,'-')
grid on



%% dsa
%Dette er et script for at forstå bin rectification/integration. Lavet af
%Mads

time = 0:0.01:1;
frequency = 6;
phase = 0;
phase_in_rad = degtorad(phase);
y = sin(2 * pi * frequency * time + phase_in_rad);
plot(time, y) 
xlabel('Time') 
ylabel('Sine wave')
y1=abs(y);
hold on 
%plot(time,y1)
mean(y1)
