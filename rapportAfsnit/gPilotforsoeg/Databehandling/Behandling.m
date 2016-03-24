clear
% Dette er målinger for det grønne accelerometer 

%% Loader data for acc
% Plan opad
PO_1 = load('B_10sek_0gx')
PO_2 = load('B_10sek_0gx')
PO_3 = load('B_10sek_0gx')
% Plan nedad
PN_1 = load('B_10sek_0gy')
PN_2 = load('B_10sek_0gy')
PN_3 = load('B_10sek_0gy')

% Lodret opad
LO_1 = load('B_10sek_0gz')
LO_2 = load('B_10sek_0gz')
LO_3 = load('B_10sek_0gz')
% Lodret nedad
LN_1 = load('B_10sek_0gz')
LN_2 = load('B_10sek_0gz')
LN_3 = load('B_10sek_0gz')


% Vandret mod højre
VH_1 = load('B_10sek_1gy')
VH_2 = load('B_10sek_1gy')
VH_3 = load('B_10sek_1gy')
% Vandret mod venstre
VV_1 = load('B_10sek_1gy')
VV_2 = load('B_10sek_1gy')
VV_3 = load('B_10sek_1gy')


%% Finder mean af de forskellige målinger

% mean plan opad
PO_1mean = mean(PO_1.data(1:L))
PO_2mean = mean(PO_2.data(1:L))
PO_3mean = mean(PO_3.data(1:L))
B_PO = [PO_1mean PO_2mean PO_3mean]
B_POmean = mean(B_PO)
% mean plan nedad
PN_1mean = mean(PN_1.data(1:L))
PN_2mean = mean(PN_2.data(1:L))
PN_3mean = mean(PN_3.data(1:L))
B_PN = [PN_1mean PN_2mean PN_3mean]
B_PNmean = mean(B_NO)

% mean lodret opad
LO_1mean = mean(LO_1.data(1:L))
LO_2mean = mean(LO_2.data(1:L))
LO_3mean = mean(LO_3.data(1:L))
B_LO = [LO_1mean LO_2mean LO_3mean]
B_LOmean = mean(B_LO)
% mean lodret nedad
LN_1mean = mean(LN_1.data(1:L))
LN_2mean = mean(LN_2.data(1:L))
LN_3mean = mean(LN_3.data(1:L))
B_LN = [LN_1mean LN_2mean LN_3mean]
B_LNmean = mean(B_LN)

% mean vandret mod højre
VH_1mean = mean(VH_1.data(1:L))
VH_2mean = mean(VH_2.data(1:L))
VH_3mean = mean(VH_3.data(1:L))
B_VH = [VH_1mean VH_2mean VH_3mean]
B_VHmean = mean(B_VH)
% mean vandret mod venstre
VV_1mean = mean(VV_1.data(1:L))
VV_2mean = mean(VV_2.data(1:L))
VV_3mean = mean(VV_3.data(1:L))
B_VV = [VV_1mean VV_2mean VV_3mean]
B_VVmean = mean(B_VV)

%% Finder afvigelse i plan opad og plan nedad
B_POafv = ((B_POmean-1.7)/1.7)*100 % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
B_PNafv = ((B_PNmean-1.7)/1.7)*100 % 1.7 er i forhold til databladet skal være det halve af spændingsforsyningen 3.4V/2
% gennemsnit skal måske findes her ved brug af:
B_afv = [B_POafv B_PNafv]
B_afvmean = mean(B_afv)

%% Data uden offset
% Plan:
B_POUoff = B_POmean - B_afvmean
B_PNUoff = B_PNmean - B_afvmean

% Lodret:
B_LOUoff = B_LOmean - B_afvmean
B_LNUoff = B_LNmean - B_afvmean

% vandret:
B_VHUoff = B_VHmean - B_afvmean
B_VVUoff = B_VVmean - B_afvmean

%% Finder værdien for enkelt grad:
EnGradP = B1gPUdenOffset/90
EnGradN = B1gNUdenOffset/90

%% Finder 90 grader
GraderP = (EnGradP*90)
GraderN = (EnGradN*90)

%% plot af tidsgrafer:


 

