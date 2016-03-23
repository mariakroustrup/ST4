clear

%% Loader data
B0 = load('Baseline_30sek_0g')
B1 = load('Baseline_30sek_1g')

%% Konstanter
Fs = 500;
Samplelength = 30;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;     %Define the frequency domain f
%% Gennemsnitsværdi
Offset0 = mean(B0.data)
Offset1 = mean(B1.data)

%% plot af baseline
figure
plot(B0.data)
plot(B1.data)

%% FFT af baseline
fftB0 = fft(B0.data);
fftB1 = fft(B1.data);

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2_0 = abs(fftB0/L);
P1_0 = P2(1:L/2+1);
P1_0(2:end-1) = 2*P1(2:end-1);

P2_1 = abs(fftB1/L);
P1_1 = P2(1:L/2+1);
P1_1(2:end-1) = 2*P1(2:end-1);

 %Plot the single-sided amplitude spectrum P1.
figure
plot(f,P1_0)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 0g') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('frekvens (Hz)')
ylabel('volt (V)')

figure
plot(f,P1_1)
axis([-10 250 0 0.0004])
title('Frekvensspektrum for baseline ved 1g') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('frekvens (Hz)')
ylabel('volt (V)')




