clc
clear

laengde     = 8;
startfrek   = 0;
slutfrek    = 15;
offset      = 1.65;
forskydning = 100;
load('LAVPASSSWEEEP');
data1 = LAVPASSSWEEEP(:,1)
data2 = data1'
LAVPASS1 = data2(170:1969);
LAVPASS = LAVPASS1*(3.3/2048)



%figure
%plot(data)
%%%-------------------------------------%%%
frekvens    = 100;
interfrek = slutfrek-startfrek;
a=LAVPASS(forskydning : forskydning + laengde * frekvens - 1);
a=a+offset;
abs_a=abs(a);
tid = [0 : +1/frekvens : laengde-1/frekvens];
tid = (tid/laengde)*interfrek+startfrek;

L  = laengde*frekvens;
Y  = fft(a);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f  = frekvens*(0:(L/2))/L;
min(a)
max(a)

figure
subplot(1,2,1)
%semilogx(tid,a)
plot(tid,a)
%plot(f,P1)
%axis([startfrek-0.03*interfrek slutfrek+0.03*interfrek min(abs_a)-0.1*abs(min(abs_a)+max(abs_a)) max(abs_a)+0.1*abs(min(abs_a)+max(abs_a))])
axis([startfrek-0.03*interfrek slutfrek+0.03*interfrek min(a)-0.1*(max(a)) max(a)+0.1*(max(a)) ])
ylabel('Amplitude (V)')
xlabel('Frekvens (Hz)')
title('a)')
set(gca,'fontsize',20);
hold on
