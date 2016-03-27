clear
% Dette er målinger for det grønne accelerometer 

%% Konstanter
Fs = 100;
Samplelength = 10;
T = 1/Fs;
L = Fs*Samplelength;
t = (0:L-1)*T;
f = Fs*(0:(L/2))/L;     %Define the frequency domain f
%get(0,'Factory');
%set(0,'defaultfigurecolor',[1,1,1]);

%% Loader data for acc
% Plan opad
PO_1 = load('PO_1')
PO_2 = load('PO_2')
PO_3 = load('PO_3')

% Plan nedad
PN_1 = load('PN_1')
PN_2 = load('PN_2')
PN_3 = load('PN_3')

% Lodret opad
LO_1 = load('LO_1')
LO_2 = load('LO_2')
LO_3 = load('LO_3')
% Lodret nedad
LN_1 = load('LN_1')
LN_2 = load('LN_2')
LN_3 = load('LN_3')

% Vandret mod højre
VH_1 = load('VH_1')
VH_2 = load('VH_2')
VH_3 = load('VH_3')
% Vandret mod venstre
VV_1 = load('VV_1')
VV_2 = load('VV_2')
VV_3 = load('VV_3')


%% Finder mean af de forskellige målinger

% mean plan opad
PO_1mean = mean(PO_1.data(1:L))
PO_2mean = mean(PO_2.data(1:L))
PO_3mean = mean(PO_3.data(1:L))
PO = [PO_1mean PO_2mean PO_3mean]
POmean = mean(PO)
% mean plan nedad
PN_1mean = mean(PN_1.data(1:L))
PN_2mean = mean(PN_2.data(1:L))
PN_3mean = mean(PN_3.data(1:L))
PN = [PN_1mean PN_2mean PN_3mean]
PNmean = mean(PN)

% mean lodret opad
LO_1mean = mean(LO_1.data(1:L))
LO_2mean = mean(LO_2.data(1:L))
LO_3mean = mean(LO_3.data(1:L))
LO = [LO_1mean LO_2mean LO_3mean]
LOmean = mean(LO)
% mean lodret nedad
LN_1mean = mean(LN_1.data(1:L))
LN_2mean = mean(LN_2.data(1:L))
LN_3mean = mean(LN_3.data(1:L))
LN = [LN_1mean LN_2mean LN_3mean]
LNmean = mean(LN)

% mean vandret mod højre
VH_1mean = mean(VH_1.data(1:L))
VH_2mean = mean(VH_2.data(1:L))
VH_3mean = mean(VH_3.data(1:L))
VH = [VH_1mean VH_2mean VH_3mean]
VHmean = mean(VH)
% mean vandret mod venstre
VV_1mean = mean(VV_1.data(1:L))
VV_2mean = mean(VV_2.data(1:L))
VV_3mean = mean(VV_3.data(1:L))
VV = [VV_1mean VV_2mean VV_3mean]
VVmean = mean(VV)

%% Finder afvigelse 
POafv = ((POmean-1.7)/1.7)*100 % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
PNafv = ((PNmean-1.7)/1.7)*100 % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
% gennemsnit skal måske findes her ved brug af:
%afv = [LOafv LNafv]
%afvmean = mean(afv)
LOafv = ((LOmean-1.7)/1.7)*100 % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
LNafv = ((LNmean-1.7)/1.7)*100 % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2

VHafv = ((VHmean-1.7)/1.7)*100 % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
VVafv = ((VVmean-1.7)/1.7)*100 % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2

%% Data uden offset
% Plan:
POUoff = POmean - POafv
PNUoff = PNmean - PNafv

% Lodret:
LOUoff = LOmean - LOafv
LNUoff = LNmean - LOafv

% vandret:
VHUoff = VHmean - VHafv
VVUoff = VVmean - VVafv
%% Finder værdien for enkelt grad:
EnGradPO = POafv/90
EnGradPN = PNafv/90

EnGradLO = LOafv/90
EnGradLN = LNafv/90

EnGradVH = VHafv/90
EnGradVV = VVafv/90
%% Finder 90 grader
POGrader = (EnGradPO*90)
PNGrader = (EnGradPN*90)

%% plot af tidsgrafer:
% Måling 1
figure
subplot(1,3,1)
plot(t, PO_1.data(1:L))
axis([0 30 1 2])
title('Volt målt ved de forkellige målinger (1. måling)')
xlabel('Tid i sekunder')
ylabel('Spænding målt i volt')
% hold on
% plot(t, PN_1.data(1:L))
% hold on
% plot(t, LO_1.data(1:L))
% hold on
% plot(t, LN_1.data(1:L))
% hold on
% plot(t, VH_1.data(1:L))
% hold on
% plot(t, VV_1.data(1:L))

% Måling 2
subplot(1,3,2)
plot(t, PO_2.data(1:L))
axis([0 30 1 2])
title('Volt målt ved de forskellige målinger (2. måling)')
xlabel('Tid i sekunder')
ylabel('Spænding målt i volt')
hold on
% plot(t, PN_2.data(1:L))
% hold on
% plot(t, LO_2.data(1:L))
% hold on
% plot(t, LN_2.data(1:L))
% hold on
% plot(t, VH_2.data(1:L))
% hold on
% plot(t, VV_2.data(1:L))

% Måling 3
subplot(1,3,3)
plot(t, PO_3.data(1:L))
axis([0 30 1 2])
title('Volt målt ved de forskellige målinger (3. måling)')
xlabel('Tid i sekunder')
ylabel('Spænding målt i volt')
% hold on
% plot(t, PN_3.data(1:L))
% hold on
% plot(t, LO_3.data(1:L))
% hold on
% plot(t, LN_3.data(1:L))
% hold on
% plot(t, VH_3.data(1:L))
% hold on
% plot(t, VV_3.data(1:L))
 
%% FFT af måling 1 plan opad 
fftPO_1 = fft(PO_1.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2PO_1 = abs(fftPO_1/L);
P1PO_1 = P2PO_1(1:L/2+1);
P1PO_1(2:end-1) = 2*P1PO_1(2:end-1);

%Plot the single-sided amplitude spectrum P1.
figure
subplot(3,1,1) %% Hvis det skal være i hver sin figur, så slet det her
plot(f,P1PO_1)
axis([-10 100 0 1])
title('Frekvensspektrum for plan opad (1 måling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens målt i Hz')
ylabel('Spændingen målt i volt')

%% FFT af måling 2 plan opad
fftPO_2 = fft(PO_2.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2PO_2 = abs(fftPO_2/L);
P1PO_2 = P2PO_2(1:L/2+1);
P1PO_2(2:end-1) = 2*P1PO_2(2:end-1);

%Plot the single-sided amplitude spectrum P1.
subplot(3,1,2) %% Hvis det skal være i hver sin figur, så slet det her
plot(f,P1PO_2)
axis([-10 100 0 1])
title('Frekvensspektrum for plan nedad (2 måling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens målt i Hz')
ylabel('Spændingen målt i volt')

%% FFT af måling 3 plan opad  
fftPO_3 = fft(PO_3.data(1:L));

%Compute the two-sided spectrum P2. 
%Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2PO_3 = abs(fftPO_3/L);
P1PO_3 = P2PO_3(1:L/2+1);
P1PO_3(2:end-1) = 2*P1PO_3(2:end-1);

%Plot the single-sided amplitude spectrum P1.
subplot(3,1,3) %% Hvis det skal være i hver sin figur, så slet det her
plot(f,P1PO_3)
axis([-10 100 0 1])
title('Frekvensspektrum for plan nedad (3 måling)') 
%title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frekvens målt i Hz')
ylabel('Spændingen målt i volt')

%% FFT af måling 1 lodret opad  - dette kan også gøres ved de 2 andre målinger
% fftLO_1 = fft(LO_1.data(1:L));
% 
% %Compute the two-sided spectrum P2. 
% %Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
% P2LO_1 = abs(fftLO_1/L);
% P1LO_1 = P2LO_1(1:L/2+1);
% P1LO_1(2:end-1) = 2*P1LO_1(2:end-1);
% 
% %Plot the single-sided amplitude spectrum P1.
% figure
% subplot(3,1,3) %% Hvis det skal være i hver sin figur, så slet det her
% plot(f,P1LO_1)
% axis([-10 100 0 1])
% title('Frekvensspektrum for loadret opad (1 måling)') 
% %title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('Frekvens målt i Hz')
% ylabel('Spændingen målt i volt')

% %% FFT af måling 1 lodret nedad  - dette kan også gøres ved de 2 andre målinger
% fftLN_1 = fft(LN_1.data(1:L));
% 
% %Compute the two-sided spectrum P2. 
% %Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
% P2LN_1 = abs(fftLN_1/L);
% P1LN_1 = P2LN_1(1:L/2+1);
% P1LN_1(2:end-1) = 2*P1LN_1(2:end-1);
% 
% %Plot the single-sided amplitude spectrum P1.
% figure
% subplot(3,1,1) %% Hvis det skal være i hver sin figur, så slet det her
% plot(f,P1LN_1)
% axis([-10 100 0 1])
% title('Frekvensspektrum for loadret nedad (1 måling)') 
% %title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('Frekvens målt i Hz')
% ylabel('Spændingen målt i volt')
% 
% %% FFT af måling 1 vandret højre  - dette kan også gøres ved de 2 andre målinger
% fftVH_1 = fft(VH_1.data(1:L));
% 
% %Compute the two-sided spectrum P2. 
% %Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
% P2VH_1 = abs(fftVH_1/L);
% P1VH_1 = P2VH_1(1:L/2+1);
% P1VH_1(2:end-1) = 2*P1VH_1(2:end-1);
% 
% %Plot the single-sided amplitude spectrum P1.
% figure
% subplot(3,1,2) %% Hvis det skal være i hver sin figur, så slet det her
% plot(f,P1VH_1)
% axis([-10 100 0 1])
% title('Frekvensspektrum for vandret højre (1 måling)') 
% %title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('Frekvens målt i Hz')
% ylabel('Spændingen målt i volt')
% 
% %% FFT af måling 1 vandret venstre  - dette kan også gøres ved de 2 andre målinger
% fftVV_1 = fft(VV_1.data(1:L));
% 
% %Compute the two-sided spectrum P2. 
% %Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
% P2VV_1 = abs(fftVV_1/L);
% P1VV_1 = P2VV_1(1:L/2+1);
% P1VV_1(2:end-1) = 2*P1VV_1(2:end-1);
% 
% %Plot the single-sided amplitude spectrum P1.
% figure
% subplot(3,1,3) %% Hvis det skal være i hver sin figur, så slet det her
% plot(f,P1VV_1)
% axis([-10 100 0 1])
% title('Frekvensspektrum for vandret højre (1 måling)') 
% %title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('Frekvens målt i Hz')
% ylabel('Spændingen målt i volt')
% 
% 
