load('matlab1.mat')

Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;


input1=data(:,1)*(3.3/2^11)
input2=data(:,2)*(3.3/2^11)
input3=(data(:,3)-1024)*(3.3/2^11);

figure
hold on 
plot(t,input1)
plot(t,input2)
plot(t,input3)
xlabel('Tid [s]')
ylabel('Accelerometer [V]')
legend('X-aksen','Y-aksen','Z-aksen')
set(gca,'fontsize',20);
box off