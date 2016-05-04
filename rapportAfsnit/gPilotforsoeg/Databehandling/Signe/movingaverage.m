clear all

dd =  load('Nedogop1.mat');
x = dd.data(1,:);
clear dd
a = 1;
t = 1:length(x)

    
x1 = 1/5;
b1 = [x1 x1 x1 x1 x1];
y1 = filter(b1,a,x);

x2 = 1/10;
b2 = [x2 x2 x2 x2 x2 x2 x2 x2 x2 x2];
y2 = filter(b2,a,x);

x3 = 1/15;
b3 = [x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3];
y3 = filter(b3,a,x);

x4 = 1/20;
b4 = [x4 x4 x4 x4 x4 x4 x4 x4 x4 x4 x4 x4 x4 x4 x4 x4 x4 x4 x4 x4];
y4 = filter(b4,a,x);


figure
subplot(4,1,1)
plot(t,x,t,y1,'r')
title('5 samples')
xlabel('Samples')
ylabel('Spænding [V]')
ylim([1.4 1.65])
set(gca,'fontsize',20);
box off
grid on

subplot(4,1,2)
plot(t,x,t,y2,'r')
title('10 samples')
xlabel('Samples')
ylabel('Spænding [V]')
ylim([1.4 1.65])
set(gca,'fontsize',20);
box off
grid on

subplot(4,1,3)
plot(t,x,t,y3,'r')
title('15 samples')
xlabel('Samples')
ylabel('Spænding [V]')
ylim([1.4 1.65])
set(gca,'fontsize',20);
box off
grid on

subplot(4,1,4)
plot(t,x,t,y4,'r')
title('20 samples')
xlabel('Samples')
ylabel('Spænding [V]')
ylim([1.4 1.65])
set(gca,'fontsize',20);
box off
grid on

