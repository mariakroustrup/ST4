frekvens = 100;

Wn = [0.5]/frekvens/2;
n = 4;

[b,a]  = ellip(n, 1, 70, Wn,'high');

a_filt = filtfilt(b,a,nedogop_emg_off);

m1Y_off  = fft(nedogop_emg_off);
m1P2_off = abs(m1Y_off/L);
m1P1_off = m1P2_off(1:L/2+1);
m1P1_off(2:end-1) = 2*m1P1_off(2:end-1);

m2Y_off  = fft(a_filt);
m2P2_off = abs(m2Y_off/L);
m2P1_off = m2P2_off(1:L/2+1);
m2P1_off(2:end-1) = 2*m2P1_off(2:end-1);

figure
hold on
plot(t, nedogop_emg_off([1:1150]), 'b');
plot(t, a_filt(1:1150), 'g');
xlim([0 10]);
xlabel('Tid [s]');
ylabel('Spænding [V]');
legend('Ufiltreret', 'Filtreret')
set(gca,'fontsize',20);
box off

figure
hold on
plot(f, m1P1_off,'b')
plot(f, m2P1_off,'g')
xlabel('Frekvens (Hz)')
ylabel('Størrelse')
legend('Ufiltreret','Filtreret')
set(gca,'fontsize',20);
box off