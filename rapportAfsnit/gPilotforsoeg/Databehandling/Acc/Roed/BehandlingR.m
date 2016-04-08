clear
% Dette er målinger for det røde accelerometer 

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

%% plot af tidsgrafer:
DataPO1 = (PO_1.data (1,:));
DataPO2 = (PO_2.data (1,:));
DataPO3 = (PO_3.data (1,:));
DataPO_1 = (DataPO1(1:L) + DataPO2(1:L) + DataPO3(1:L))/3;

DataPO1 = (PO_1.data (2,:));
DataPO2 = (PO_2.data (2,:));
DataPO3 = (PO_3.data (2,:));
DataPO_2 = (DataPO1(1:L) + DataPO2(1:L) + DataPO3(1:L))/3;

DataPO1 = (PO_1.data (3,:));
DataPO2 = (PO_2.data (3,:));
DataPO3 = (PO_3.data (3,:));
DataPO_3 = (DataPO1(1:L) + DataPO2(1:L) + DataPO3(1:L))/3;

DataPN1 = (PN_1.data (1,:));
DataPN2 = (PN_2.data (1,:));
DataPN3 = (PN_3.data (1,:));
DataPN_1 = (DataPN1(1:L) + DataPN2(1:L) + DataPN3(1:L))/3;

DataPN1 = (PN_1.data (2,:));
DataPN2 = (PN_2.data (2,:));
DataPN3 = (PN_3.data (2,:));
DataPN_2 = (DataPN1(1:L) + DataPN2(1:L) + DataPN3(1:L))/3;

DataPN1 = (PN_1.data (3,:));
DataPN2 = (PN_2.data (3,:));
DataPN3 = (PN_3.data (3,:));
DataPN_3 = (DataPN1(1:L) + DataPN2(1:L) + DataPN3(1:L))/3;

figure
subplot(3,2,5)
plot(t, DataPO_1(1:L))
axis([0 10 1 2])
title('Gennemsnitlig spænding målt ved plan op')
xlabel('Tid (s)')
ylabel('Spænding (V)')
hold on
plot(t, DataPO_2(1:L))
hold on
plot(t, DataPO_3(1:L))
legend(['x-akse'; 'y-akse'; 'z-akse'], 'Location', 'southwest'); 
set(gca,'fontsize',20);

subplot(3,2,6)
plot(t, DataPN_1(1:L))
axis([0 10 1 2])
title('Gennemsnitlig spænding målt ved plan ned')
xlabel('Tid (s)')
ylabel('Spænding (V)')
hold on
plot(t, DataPN_2(1:L))
hold on
plot(t, DataPN_3(1:L))
legend(['x-akse'; 'y-akse'; 'z-akse'], 'Location', 'southwest');
set(gca,'fontsize',20);

DataLO1 = (LO_1.data (1,:));
DataLO2 = (LO_2.data (1,:));
DataLO3 = (LO_3.data (1,:));
DataLO_1 = (DataLO1(1:L) + DataLO2(1:L) + DataLO3(1:L))/3;

DataLO1 = (LO_1.data (2,:));
DataLO2 = (LO_2.data (2,:));
DataLO3 = (LO_3.data (2,:));
DataLO_2 = (DataLO1(1:L) + DataLO2(1:L) + DataLO3(1:L))/3;

DataLO1 = (LO_1.data (3,:));
DataLO2 = (LO_2.data (3,:));
DataLO3 = (LO_3.data (3,:));
DataLO_3 = (DataLO1(1:L) + DataLO2(1:L) + DataLO3(1:L))/3;

DataLN1 = (LN_1.data (1,:));
DataLN2 = (LN_2.data (1,:));
DataLN3 = (LN_3.data (1,:));
DataLN_1 = (DataLN1(1:L) + DataLN2(1:L) + DataLN3(1:L))/3;

DataLN1 = (LN_1.data (2,:));
DataLN2 = (LN_2.data (2,:));
DataLN3 = (LN_3.data (2,:));
DataLN_2 = (DataLN1(1:L) + DataLN2(1:L) + DataLN3(1:L))/3;

DataLN1 = (LN_1.data (3,:));
DataLN2 = (LN_2.data (3,:));
DataLN3 = (LN_3.data (3,:));
DataLN_3 = (DataLN1(1:L) + DataLN2(1:L) + DataLN3(1:L))/3;

subplot(3,2,3)
plot(t, DataLO_1(1:L))
axis([0 10 1 2])
title('Gennemsnitlig spænding målt ved lodret op')
xlabel('Tid (s)')
ylabel('Spænding (V)')
hold on
plot(t, DataLO_2(1:L))
hold on
plot(t, DataLO_3(1:L))
legend(['x-akse'; 'y-akse'; 'z-akse'], 'Location', 'southwest');
set(gca,'fontsize',20);


subplot(3,2,4)
plot(t, DataLN_1(1:L))
axis([0 10 1 2])
title('Gennemsnitlig spænding målt ved lodret ned')
xlabel('Tid (s)')
ylabel('Spænding (V)')
hold on 
plot(t, DataLN_2(1:L))
hold on
plot(t, DataLN_3(1:L))
legend(['x-akse'; 'y-akse'; 'z-akse'], 'Location', 'southwest');
set(gca,'fontsize',20);

DataVV1 = (VV_1.data (1,:));
DataVV2 = (VV_2.data (1,:));
DataVV3 = (VV_3.data (1,:));
DataVV_1 = (DataVV1(1:L) + DataVV2(1:L) + DataVV3(1:L))/3;

DataVV1 = (VV_1.data (2,:));
DataVV2 = (VV_2.data (2,:));
DataVV3 = (VV_3.data (2,:));
DataVV_2 = (DataVV1(1:L) + DataVV2(1:L) + DataVV3(1:L))/3;

DataVV1 = (VV_1.data (3,:));
DataVV2 = (VV_2.data (3,:));
DataVV3 = (VV_3.data (3,:));
DataVV_3 = (DataVV1(1:L) + DataVV2(1:L) + DataVV3(1:L))/3;

DataVH1 = (VH_1.data (1,:));
DataVH2 = (VH_2.data (1,:));
DataVH3 = (VH_3.data (1,:));
DataVH_1 = (DataVH1(1:L) + DataVH2(1:L) + DataVH3(1:L))/3;

DataVH1 = (VH_1.data (2,:));
DataVH2 = (VH_2.data (2,:));
DataVH3 = (VH_3.data (2,:));
DataVH_2 = (DataVH1(1:L) + DataVH2(1:L) + DataVH3(1:L))/3;

DataVH1 = (VH_1.data (3,:));
DataVH2 = (VH_2.data (3,:));
DataVH3 = (VH_3.data (3,:));
DataVH_3 = (DataVH1(1:L) + DataVH2(1:L) + DataVH3(1:L))/3;

subplot(3,2,1)
plot(t, DataVV_1(1:L))
axis([0 10 1 2])
title('Gennemsnitlig spænding målt ved vandret mod venstre')
xlabel('Tid (s)')
ylabel('Spænding (V)')
hold on
plot(t, DataVV_2(1:L))
hold on
plot(t, DataVV_3(1:L))
legend(['x-akse'; 'y-akse'; 'z-akse'], 'Location', 'southwest');
set(gca,'fontsize',20);

subplot(3,2,2)
plot(t, DataVH_1(1:L))
axis([0 10 1 2])
title('Gennemsnitlig spænding målt ved vandret mod højre')
xlabel('Tid (s)')
ylabel('Spænding (V)')
hold on 
plot(t, DataVH_2(1:L))
hold on
plot(t, DataVH_3(1:L))
legend(['x-akse'; 'y-akse'; 'z-akse'],'Location', 'southwest');
set(gca,'fontsize',20);
%% Finder mean af de forskellige målinger
% mean plan opad
POmean1 = mean(DataPO_1)
POmean2 = mean(DataPO_2)
POmean3 = mean(DataPO_3)
% mean plan nedad
PNmean1 = mean(DataPN_1)
PNmean2 = mean(DataPN_2)
PNmean3 = mean(DataPN_3)

% mean lodret opad
LOmean1 = mean(DataLO_1)
LOmean2 = mean(DataLO_2)
LOmean3 = mean(DataLO_3)
% mean lodret nedad
LNmean1 = mean(DataLN_1)
LNmean2 = mean(DataLN_2)
LNmean3 = mean(DataLN_3)

% mean vandret mod højre
VHmean1 = mean(DataVH_1)
VHmean2 = mean(DataVH_2)
VHmean3 = mean(DataVH_3)
% mean vandret mod venstre
VVmean1 = mean(DataVV_1)
VVmean2 = mean(DataVV_2)
VVmean3 = mean(DataVV_3)

%% Finder afvigelse 
PO1afv = ((POmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
PO2afv = ((POmean2-1.7)/1.7)
PO3afv = ((POmean3-1.7)/1.7)
PN1afv = ((PNmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
PN2afv = ((PNmean2-1.7)/1.7)
PN3afv = ((PNmean3-1.7)/1.7)

LO1afv = ((LOmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
LO2afv = ((LOmean2-1.7)/1.7)
LO3afv = ((LOmean3-1.7)/1.7)
LN1afv = ((LNmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
LN2afv = ((LNmean2-1.7)/1.7)
LN3afv = ((LNmean3-1.7)/1.7)


VV1afv = ((VVmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
VV2afv = ((VVmean2-1.7)/1.7)
VV3afv = ((VVmean3-1.7)/1.7)
VH1afv = ((VHmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
VH2afv = ((VHmean2-1.7)/1.7)
VH3afv = ((VHmean3-1.7)/1.7)

%% Data uden offset
% Plan:
POUoff1 = POmean1-PO1afv
POUoff2 = POmean2-PO2afv
POUoff3 = POmean3-PO3afv
PNUoff1 = PNmean1-PN1afv
PNUoff2 = PNmean2-PN2afv
PNUoff3 = PNmean3-PN3afv

%lodret:
LOUoff1 = LOmean1-LO1afv
LOUoff2 = LOmean2-LO2afv
LOUoff3 = LOmean3-LO3afv
LNUoff1 = LNmean1-LN1afv
LNUoff2 = LNmean2-LN2afv
LNUoff3 = LNmean3-LN3afv

%vandret:
VVUoff1 = VVmean1-VV1afv
VVUoff2 = VVmean2-VV2afv
VVUoff3 = VVmean3-VV3afv
VHUoff1 = VHmean1-VH1afv
VHUoff2 = VHmean2-VH2afv
VHUoff3 = VHmean3-VH3afv

%% TING DER IKKE BENYTTES MERE!!

%%Finder værdien for enkelt grad:
% EnGradPO1 = PO1afv/90
% EnGradPO2 = PO2afv/90
% EnGradPO3 = PO3afv/90
% 
% EnGradPN1 = PN1afv/90
% EnGradPN2 = PN2afv/90
% EnGradPN3 = PN3afv/90
% 
% EnGradLO1 = LO1afv/90
% EnGradLO2 = LO2afv/90
% EnGradLO3 = LO3afv/90
% 
% EnGradLN1 = LN1afv/90
% EnGradLN2 = LN2afv/90
% EnGradLN3 = LN3afv/90
% 
% EnGradVV1 = VV1afv/90
% EnGradVV2 = VV2afv/90
% EnGradVV3 = VV3afv/90
% 
% EnGradVH1 = VH1afv/90
% EnGradVH2 = VH2afv/90
% EnGradVH3 = VH3afv/90

%% Finder 90 grader
% POGrader1 = (EnGradPO1*90)
% POGrader2 = (EnGradPO2*90)
% POGrader3 = (EnGradPO3*90)
% 
% PNGrader1 = (EnGradPN1*90)
% PNGrader2 = (EnGradPN2*90)
% PNGrader3 = (EnGradPN3*90)
% 
% LOGrader1 = (EnGradLO1*90)
% LOGrader2 = (EnGradLO2*90)
% LOGrader3 = (EnGradLO3*90)
% 
% LNGrader1 = (EnGradLN1*90)
% LNGrader2 = (EnGradLN2*90)
% LNGrader3 = (EnGradLN3*90)
% 
% VVGrader1 = (EnGradVV1*90)
% VVGrader2 = (EnGradVV2*90)
% VVGrader3 = (EnGradVV3*90)
% 
% VHGrader1 = (EnGradVH1*90)
% VHGrader2 = (EnGradVH2*90)
% VHGrader3 = (EnGradVH3*90)

%% FFT af måling 1 plan opad 
% fftPO_1 = fft(PO_1.data(1:L));
% 
% %Compute the two-sided spectrum P2. 
% %Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
% P2PO_1 = abs(fftPO_1/L);
% P1PO_1 = P2PO_1(1:L/2+1);
% P1PO_1(2:end-1) = 2*P1PO_1(2:end-1);
% 
% %Plot the single-sided amplitude spectrum P1.
% figure
% subplot(3,1,1) %% Hvis det skal være i hver sin figur, så slet det her
% plot(f,P1PO_1)
% axis([-10 100 0 1])
% title('Frekvensspektrum for plan opad (1 måling)') 
% %title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('Frekvens målt i Hz')
% ylabel('Spændingen målt i volt')
% 
% %% FFT af måling 2 plan opad
% fftPO_2 = fft(PO_2.data(1:L));
% 
% %Compute the two-sided spectrum P2. 
% %Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
% P2PO_2 = abs(fftPO_2/L);
% P1PO_2 = P2PO_2(1:L/2+1);
% P1PO_2(2:end-1) = 2*P1PO_2(2:end-1);
% 
% %Plot the single-sided amplitude spectrum P1.
% subplot(3,1,2) %% Hvis det skal være i hver sin figur, så slet det her
% plot(f,P1PO_2)
% axis([-10 100 0 1])
% title('Frekvensspektrum for plan nedad (2 måling)') 
% %title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('Frekvens målt i Hz')
% ylabel('Spændingen målt i volt')
% 
% %% FFT af måling 3 plan opad  
% fftPO_3 = fft(PO_3.data(1:L));
% 
% %Compute the two-sided spectrum P2. 
% %Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
% P2PO_3 = abs(fftPO_3/L);
% P1PO_3 = P2PO_3(1:L/2+1);
% P1PO_3(2:end-1) = 2*P1PO_3(2:end-1);
% 
% %Plot the single-sided amplitude spectrum P1.
% subplot(3,1,3) %% Hvis det skal være i hver sin figur, så slet det her
% plot(f,P1PO_3)
% axis([-10 100 0 1])
% title('Frekvensspektrum for plan nedad (3 måling)') 
% %title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('Frekvens målt i Hz')
% ylabel('Spændingen målt i volt')

