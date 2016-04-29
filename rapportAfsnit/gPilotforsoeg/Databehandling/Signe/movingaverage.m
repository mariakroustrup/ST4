clear all

dd =  load('Nedogop1.mat');
x = dd.data(1,:);
clear dd
a = 1;
t = 1:length(x)

x1 = 1/10;
b1 = [x1 x1 x1 x1 x1 x1 x1 x1 x1 x1];
y1 = filter(b1,a,x);

x2 = 1/15;
b2 = [x2 x2 x2 x2 x2 x2 x2 x2 x2 x2 x2 x2 x2 x2 x2];
y2 = filter(b2,a,x);

x3 = 1/20;
b3 = [x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3];
y3 = filter(b3,a,x);

figure
subplot(3,1,1)
plot(t,x,t,y1,'r')
ylim([1.4 1.65])
grid on

subplot(3,1,2)
plot(t,x,t,y2,'r')
ylim([1.4 1.65])
grid on

subplot(3,1,3)
plot(t,x,t,y3,'r')
ylim([1.4 1.65])
grid on

