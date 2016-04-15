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
subplot(3,2,5);
plot(t, DataPO_1(1:L));
axis([0 10 1 2]);
title('Gennemsnitlig spænding målt ved plan op')
xlabel('Tid [s]')
ylabel('Spænding [V]')
hold on
plot(t, DataPO_2(1:L));
hold on
plot(t, DataPO_3(1:L));
legend(['X-akse'; 'Y-akse'; 'Z-akse'], 'Location', 'southwest'); 
set(gca,'fontsize',20);
box off

subplot(3,2,6);
plot(t, DataPN_1(1:L));
axis([0 10 1 2]);
title('Gennemsnitlig spænding målt ved plan ned')
xlabel('Tid [s]')
ylabel('Spænding [V]')
hold on
plot(t, DataPN_2(1:L));
hold on
plot(t, DataPN_3(1:L));
legend(['X-akse'; 'Y-akse'; 'Z-akse'], 'Location', 'southwest');
set(gca,'fontsize',20);
box off 
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

subplot(3,2,3);
plot(t, DataLO_1(1:L));
axis([0 10 1 2]);
title('Gennemsnitlig spænding målt ved lodret op')
xlabel('Tid [s]')
ylabel('Spænding [V]')
hold on
plot(t, DataLO_2(1:L));
hold on
plot(t, DataLO_3(1:L));
legend(['X-akse'; 'Y-akse'; 'Z-akse'], 'Location', 'southwest');
set(gca,'fontsize',20);
box off

subplot(3,2,4);
plot(t, DataLN_1(1:L));
axis([0 10 1 2]);
title('Gennemsnitlig spænding målt ved lodret ned')
xlabel('Tid [s]')
ylabel('Spænding [V]')
hold on 
plot(t, DataLN_2(1:L));
hold on
plot(t, DataLN_3(1:L));
legend(['X-akse'; 'Y-akse'; 'Z-akse'], 'Location', 'southwest');
set(gca,'fontsize',20);
box off

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

subplot(3,2,1);
plot(t, DataVV_1(1:L));
axis([0 10 1 2]);
title('Gennemsnitlig spænding målt ved vandret mod venstre')
xlabel('Tid [s]')
ylabel('Spænding [V]')
hold on
plot(t, DataVV_2(1:L));
hold on
plot(t, DataVV_3(1:L));
legend(['X-akse'; 'Y-akse'; 'Z-akse'], 'Location', 'southwest');
set(gca,'fontsize',20);
box off

subplot(3,2,2);
plot(t, DataVH_1(1:L));
box off
axis([0 10 1 2]);
title('Gennemsnitlig spænding målt ved vandret mod højre')
xlabel('Tid [s]')
ylabel('Spænding [V]')
hold on 
plot(t, DataVH_2(1:L));
hold on
plot(t, DataVH_3(1:L));
legend(['X-akse'; 'Y-akse'; 'Z-akse'],'Location', 'southwest');
set(gca,'fontsize',20);
box off



%%  Offset:
POoff = DataPO_2(1) %1.6362
PNoff = DataPN_2(1) %1.6413

%% Offset i forhold til teoretiske
POofft = ((DataPO_2(1)-1.7)/1.7)*100 %3.75
PNofft = ((DataPN_2(1)-1.7)/1.7)*100 %3.45

%% Sensititivtet 
LOsen = DataLO_2(1)-POoff %0.2828
LNsen = DataLN_2(1)-PNoff %-0.2785

%% beregning af 0 og 90 grader
graderP = POoff + (LOsen*0)
graderN = PNoff + (LNsen*0)
halvfemsgraderP = POoff + (LOsen*90) % 27.0869
halvfemsgraderN = PNoff + (LNsen*90) %-23.4271

%% TING DER IKKE BENYTTES MERE:

% %% Finder mean af de forskellige målinger
% % mean plan opad
% POmean1 = mean(DataPO_1)
% POmean2 = mean(DataPO_2)
% POmean3 = mean(DataPO_3)
% % mean plan nedad
% PNmean1 = mean(DataPN_1)
% PNmean2 = mean(DataPN_2)
% PNmean3 = mean(DataPN_3)
% 
% % mean lodret opad
% LOmean1 = mean(DataLO_1)
% LOmean2 = mean(DataLO_2)
% LOmean3 = mean(DataLO_3)
% % mean lodret nedad
% LNmean1 = mean(DataLN_1)
% LNmean2 = mean(DataLN_2)
% LNmean3 = mean(DataLN_3)
% 
% % mean vandret mod højre
% VHmean1 = mean(DataVH_1)
% VHmean2 = mean(DataVH_2)
% VHmean3 = mean(DataVH_3)
% % mean vandret mod venstre
% VVmean1 = mean(DataVV_1)
% VVmean2 = mean(DataVV_2)
% VVmean3 = mean(DataVV_3)

%% Finder afvigelse 
% PO1afv = ((POmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
% PO2afv = ((POmean2-1.7)/1.7)
% PO3afv = ((POmean3-1.7)/1.7)
% PN1afv = ((PNmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
% PN2afv = ((PNmean2-1.7)/1.7)
% PN3afv = ((PNmean3-1.7)/1.7)
% 
% LO1afv = ((LOmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
% LO2afv = ((LOmean2-1.7)/1.7)
% LO3afv = ((LOmean3-1.7)/1.7)
% LN1afv = ((LNmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
% LN2afv = ((LNmean2-1.7)/1.7)
% LN3afv = ((LNmean3-1.7)/1.7)
% 
% 
% VV1afv = ((VVmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
% VV2afv = ((VVmean2-1.7)/1.7)
% VV3afv = ((VVmean3-1.7)/1.7)
% VH1afv = ((VHmean1-1.7)/1.7) % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
% VH2afv = ((VHmean2-1.7)/1.7)
% VH3afv = ((VHmean3-1.7)/1.7)

%% Data uden offset
% % Plan:
% POUoff1 = POmean1-PO1afv
% POUoff2 = POmean2-PO2afv
% POUoff3 = POmean3-PO3afv
% PNUoff1 = PNmean1-PN1afv
% PNUoff2 = PNmean2-PN2afv
% PNUoff3 = PNmean3-PN3afv
% 
% %lodret:
% LOUoff1 = LOmean1-LO1afv
% LOUoff2 = LOmean2-LO2afv
% LOUoff3 = LOmean3-LO3afv
% LNUoff1 = LNmean1-LN1afv
% LNUoff2 = LNmean2-LN2afv
% LNUoff3 = LNmean3-LN3afv
% 
% %vandret:
% VVUoff1 = VVmean1-VV1afv
% VVUoff2 = VVmean2-VV2afv
% VVUoff3 = VVmean3-VV3afv
% VHUoff1 = VHmean1-VH1afv
% VHUoff2 = VHmean2-VH2afv
% VHUoff3 = VHmean3-VH3afv
